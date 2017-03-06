var c=document.getElementById("myCanvas");
    var cxt=c.getContext("2d");
    var centerX = 250;
    var centerY = 250;
    cxt.moveTo(centerX, centerY);

    var STEPS_PER_ROTATION = 60;
    var increment = 2*Math.PI/STEPS_PER_ROTATION;       
    var theta = increment;

    while( theta < 8*Math.PI) {
      var newX = centerX + theta * Math.cos(theta); 
      var newY = centerY + theta * Math.sin(theta); 
      cxt.lineTo(newX, newY);
      theta = theta + increment;
    }
    cxt.stroke();