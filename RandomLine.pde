public class RandomLine {
  
  int x, y;
  color pointColor;
  
  RandomLine(int x, int y) {
    this.x = x;
    this.y = y;
    pointColor = color(0, 0, 0);
  }
  
  public void move() {
      float rand = random(1);
      if (rand < .25) {
       y++;
      } else if (rand >= .25 && rand < .5) {
       y--;
      } else if (rand >= .5 && rand < .75) {
       x++;
      } else {
       x--;
      }
      if (x < 0) {
       x = 0;
      } else if (x > width) {
       x = width;
      } else if (y < 0) {
       y = 0;
      } else if (y > height) {
       y = height;
      }
      pointColor = color(random(255), random(255), random(255));
  }
  
  public void newPoint(double[] adjustedOutput) {
      float rand = random(1);
      if (rand < adjustedOutput[0]) {
       y++;
      } else if (rand >= adjustedOutput[0] && rand < adjustedOutput[0] + adjustedOutput[1]) {
       y--;
      } else if (rand >= adjustedOutput[0] + adjustedOutput[1] && rand < adjustedOutput[0] + adjustedOutput[1] + adjustedOutput[2]) {
       x++;
      } else {
       x--;
      }
      if (x < 0) {
       x = 0;
      } else if (x > width) {
       x = width;
      } else if (y < 0) {
       y = 0;
      } else if (y > height) {
       y = height;
      }
      pointColor = (int) adjustedOutput[4];
  }
  
  public void drawPoint() {
    stroke(pointColor);
    point(x, y);
  }
  
}