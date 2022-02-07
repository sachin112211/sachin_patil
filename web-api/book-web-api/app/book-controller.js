const db = require('../db/models');
const Book = db.Book;



exports.findAll=(req,resp)=>{
    Book.findAll()
     .then(data=>resp.json(data))
     .catch(err=>{
         resp.status(500)
         .send({message:err.message || `something went wrong`})
     });
};


exports.findByPk=(req,resp)=>{
    const id = parseInt(req.params.id);
    Book.findByPk(id)
     .then(data=>resp.json(data))
        .catch(err=>{
           resp.status(500)
           .send({message:err.message ||
        `something went wrong`})


        });

};


exports.create = (req,resp)=>{
    if(!req.body.bookName)
        resp.status(400)
        .send({message:`first name must be provided`});

        const newBook={
            bookName : req.body.bookName,
            authorName:req.body.authorName,
            createdAt: new Date(),
            updatedAt: new Date()
        }

        Book.create(newBook)
          .then(data=>resp.send(data))

          .catch(err=>{
            resp.status(500)
             .send({message:err.message}||`something went wrong`)

          })
}



exports.update=(req,resp)=>{
    const id =req.params.id;
    Book.update(req.body,{where:{id:id}})
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
        Book.destroy({where:{id:id}})
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