const db = require('../db/models');
const Car = db.Car;


exports.findAll=(req,resp)=>{
    Car.findAll()
     .then(data=>resp.json(data))
    
    .catch(err=>{
       resp.send(500)
       .send({message:err.message || `something went wrong`})


    });
};


exports.findByPk=(req,resp)=>{
   const id = parseInt(req.params.id);
   Car.findByPk(id)
   .then(data=>resp.json(data))
   .catch(err=>{
       resp.status(500)
       .send({message:err.message || `something went wrong`})

   });



};



exports.create = (req,resp)=>{
    if(!req.body.carName)
        resp.status(400)
        .send({message:`first name must be provided`});

        const newCar={
            carName : req.body.carName,
            branchName:req.body.branchName,
            createdAt: new Date(),
            updatedAt: new Date()
        }

        Car.create(newCar)
          .then(data=>resp.send(data))

          .catch(err=>{
            resp.status(500)
             .send({message:err.message}||`something went wrong`)

          })
}

exports.update=(req,resp)=>{
    const id =req.params.id;
    Car.update(req.body,{where:{id:id}})
    .then(num=>{
        if(num==1){
            resp.send({message:`people eith id ${id} updated succesfully.` })
        }
        else{
            resp.send({
                message:`cannot update person with id ${id} maybe person was not found or req.body is empty!`
            });
        }
    })
    .catch(err=>{
        resp.status(500).send({
            message:err.message || `something error retriving data`
        })
    })
}




exports.delete = (req,resp)=>{
    const id = req.params.id;
    Car.destroy({where:{id:id}})
    .then(num=>{
        if(num==1){
            resp.send({
                message:`person with id=${id} deleted successfully`
            });
        }
        else{
            resp.send({
                mssage:`delete person with id=${id}. maybe personwas not found!`
            })
        }
    })

    .catch(err=>{
        resp.status(500).send({
            message:err.message || `could not delete person with id=`+id
        })
    })
}