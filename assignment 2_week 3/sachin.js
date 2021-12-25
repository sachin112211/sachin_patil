const express = require("express");
const app = express();
const port = 3000;
app.get("/",(req,resp)=>{
 resp.send("welome to express demo")
});
app.post("/",(req,resp)=>{
    resp.send("CALLED: POST")
});
app.put("/",(req,resp)=>{
    resp.send("CALLED: PUT")
});
app.delete("/",(req,resp)=>{
    resp.send("CALLED DELETE")
});

app.listen(port,()=>{

    console.log(`http://localhost:${port} express server is started`);
});