window.onload = function(){var canvas = document.getElementById("myCanvas");
var context = canvas.getContext("2d");

var startX = 85;
var startY = 70;
var zigzagSpacing = 20;

context.lineWidth = 3;
context.strokeStyle = "#FFFF";
context.beginPath();
context.moveTo(startX, startY);

// draw ten lines
for (var n = 0; n < 10; n++) {
var x = startY + ((n + 1) * zigzagSpacing);
var y;

if (n % 2 == 0) { // if n is even...
y = startY + 120;
}
else { // if n is odd...
y = startY;
}
context.lineTo(x, y);
}

context.stroke();
};