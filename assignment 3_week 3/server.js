const express=require('express');
const app=express();
const port =3000;
app.get('/',(req,resp)=>{
    resp.send("WElcome to Express demo");
})
app.post('/index.html',(req,resp)=>{
    resp.sendFile(__dirname+"/index.html");
});

app.put(port,()=>{
    console.log(`http://localhost:${port} Express server started `);;
})
app.delete(port,()=>{
    console.log(`http://localhost:${port} Express server started `);;
})