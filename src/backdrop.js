const canvas = document.getElementById('backdrop');
const context = canvas.getContext('2d');


let waterPosX = 0;
let waterPosY = 140;

function drawVowel() {
  context.beginPath();
  context.fillRect(20, 5, 10, 10);
  context.fillStyle = 'black';
  context.stroke();
}

function drawWater() {
  context.beginPath();
  context.fillRect(waterPosX, waterPosY, canvas.width, canvas.height);
  context.fillStyle = 'skyblue';
  context.fill();
}

function draw() {
  context.clearRect(0, 0, canvas.width, canvas.height);
  drawWater();
  drawVowel();
  waterPosY--;
}

draw();
setInterval(draw, 1500);
