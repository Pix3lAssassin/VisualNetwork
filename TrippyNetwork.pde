Network net;
double[] input;
double[] target;
double[] output;
int counter = 0;
boolean[] keys; 
RandomLine[] lines;
int clicked;

void setup() {
  background(0);
  size(400, 400);
  frameRate(60);
  net = new Network(width*height, 10, 10, 5);
  keys = new boolean[10];
  lines = new RandomLine[50];
  
  for (int i = 0; i < lines.length; i ++) {
    lines[i] = new RandomLine((int) random(width), (int) random(height));
  }
  
  input = new double[width*height];
  
  loadPixels();
  for (int i = 0; i < pixels.length; i ++) {
    input[i] = pixels[i];
  }
  
  for (int i = 0; i < 100; i++) {
    target = new double[]{1, 1, 1, 1, 1};
    net.train(input, target, .5);
  }

}

void draw() {
  counter++;
  if (counter%60 == 0) {
      clicked--;
    if (clicked <= 0) {
      for (int i = 0; i < pixels.length; i ++) {
        input[i] = pixels[i];
      }
      target = new double[]{1, 1, 1, 1, 1};
      net.train(input, target, .5);
      clicked = 0;
    }
    int min = counter/3600;
    int sec = (counter%3600)/60;
    println("Seconds left: " + clicked + "s       " + "Min: " + min + "   Sec: " + sec);
    println();
  }
  strokeWeight(4);
  
  for (int j = 0; j < 20; j ++) {
      for (int k = 0; k < pixels.length; k ++) {
        input[k] = pixels[k];
      }
      output = net.calculate(input);
      double[] adjustedOutput = math(output);
    for (int i = 0; i < lines.length; i ++) {

      
      lines[i].newPoint(adjustedOutput);
      lines[i].drawPoint();
    }
  }
  
  
  for (int i = 0; i < pixels.length; i ++) {
    input[i] = pixels[i];
  }
  output = net.calculate(input);
}

double[] math(double[] output) {
  double sum = 0;
  double[] adjustedOutput = new double[5];
  sum = output[0] + output[1] + output[2] + output[3];
  for (int i = 0; i < 4; i++) {
    adjustedOutput[i] = output[i] / sum;
  }
  adjustedOutput[4] = output[4] * pow(2, 32) - pow(2, 31);
  return adjustedOutput;
}
 //<>//
//void keyPressHandler() {
//  if (keys[0]) {
//    player.direction = 0;
//    player.move(playerSpeed);
//  } else if (keys[2]) {
//    player.direction = 2;
//    player.move(playerSpeed);
//  }
//  if (keys[1]) {
//    player.direction = 1;
//    player.move(playerSpeed);
//  } else if (keys[3]) {
//    player.direction = 3;
//    player.move(playerSpeed);
//  }
//  if (keys[4]) {
//    player.shoot();
//  }
//  if (keys[5]) {
//      player.aimDirection = 0;
//      player.updateDirection();
//  } else if (keys[6]) {
//      player.aimDirection = 1;
//      player.updateDirection();
//  } else if (keys[7]) {
//      player.aimDirection = 2;
//      player.updateDirection();
//  } else if (keys[8]) {
//      player.aimDirection = 3;
//      player.updateDirection();
//  }
//}

void mousePressed() {
  clicked++;
}

void keyPressed() {
  if (key == 'w' || key == 'W') {
    keys[0] = true;
  }
  if (key == 's' || key == 'S') {
    keys[2] = true;
  }
  if (key == 'a' || key == 'A') {
    keys[3] = true;
  } 
  if (key == 'd' || key == 'D') {
    keys[1] = true;
  }
  if (key == ' ') {
    keys[4] = true;
  }
  if (key == 'p') {
    println("Paused"); //<>//
  }
  if (key == CODED) {
    if (keyCode == UP) {
      keys[5] = true;
    }
    if (keyCode == LEFT) {
      keys[6] = true;
    }
    if (keyCode == DOWN) {
      keys[7] = true;
    }
    if (keyCode == RIGHT) {
      keys[8] = true;
    }
  }  
}

void keyReleased() {
  if (key == 'w' || key == 'W') {
    keys[0] = false;
  }
  if (key == 's' || key == 'S') {
    keys[2] = false;
  }
  if (key == 'a' || key == 'A') {
    keys[3] = false;
  } 
  if (key == 'd' || key == 'D') {
    keys[1] = false;
  }
  if (key == ' ') {
    keys[4] = false;
  }
  if (key == CODED) {
    if (keyCode == UP) {
      keys[5] = false;
    }
    if (keyCode == LEFT) {
      keys[6] = false;
    }
    if (keyCode == DOWN) {
      keys[7] = false;
    }
    if (keyCode == RIGHT) {
      keys[8] = false;
    }
  }
}