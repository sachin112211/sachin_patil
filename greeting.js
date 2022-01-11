


function greeting(msg,occasion){
  switch (msg) {
      case "chrismas":
     console.log("merry chrismas")
        break;
        case "anniversary":
     console.log("happy anniversary")
        break;
        case "birthday":
     console.log("happy birthday")
        break;
        case "new year":
     console.log("happy new year")
        break;
  
      default:
      console.log("please enter valid message")
          break;
  }

}


greeting("chrismas","merry chrismas");
greeting("birthday","happy birthday");
greeting("new year","happy new year");
greeting("anniversary","happy anniversary");
greeting("diwali","happy diwali");
