const express = require('express');
const port = 3000;
const server = express(); 
const cors = require('cors');
const CORS_OPTION = {
    origin:`http://localhost:4200`
}
server.use(express.json())
server.use(express.urlencoded({extended:true}));
server.use(cors(CORS_OPTION))
const db = require('./db/models')
db.sequelize.sync();

require('./app/app-route')(server)
server.get('/',(req,resp)=>{
  resp.send("welcome to express+postgres");
})


server.listen(port,()=>{
  console.log(`http://localhost:${port} server is started`)
})