var squareLength = 150;
var canvas = document.getElementById('myCanvas');


    var ctx = canvas.getContext('2d');

    ctx.translate(canvas.width / 2, canvas.height / 2);
    ctx.rotate(Math.PI / 4);
    ctx.translate(-(squareLength / 2), -(squareLength / 2));
    ctx.fillRect(0,0, squareLength, squareLength);

    ctx.restore();
