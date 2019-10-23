document.addEventListener("DOMContentLoaded", function(){
 const canvasEl = document.getElementById("mycanvas");

 canvasEl.width = 500;
 canvasEl.height = 500;

 const ctx = canvasEl.getContext("2d");

 ctx.fillStyle = "red";
 ctx.beginPath();
 ctx.arc(290, 290, 200, 0 , 2 * Math.PI, true);
 ctx.strokeStyle = "blue";
 ctx.lineWidth = 5;
 ctx.stroke();
 ctx.fillStyle = "teal";
 ctx.fill();
});

