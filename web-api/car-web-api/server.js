const express = require('express');
const server = express();
const port = 3000;
const cors = require('cors')
const CORS_OPTION={
   origin: 'http://localhost:4200'
}
server.use(express.json())
server.use(express.urlencoded({extended:true}))
server.use(cors(CORS_OPTION))
const db = require('./db/models')
db.sequelize.sync();

require('./app/app-route')(server)
server.get('/',(req,resp)=>{
    console.log('welcome to car webapi-assignment');
})

server.listen(port,()=>{
    console.log(`http://localhost:${port} server is started`)
})