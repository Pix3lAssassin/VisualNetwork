public class Shape {

  int x, y, direction, type, size, age;
  float drawRate, mutationChance;
  
  public Shape(int x, int y, int direction, int type, float drawRate, int size, float mutationChance) {
    this.x = x;
    this.y = y;
    this.direction = direction;
    this.type = type;
    this.drawRate = drawRate;
    this.size = size;
    this.mutationChance = mutationChance;
    age = 0;
  }

  public void drawShape() {
    //Ellipse
    if (type == 0) {
      if (age == 0) {
        point(x, y);
      } else {
        
      }
    }
    //Square
    else if (type == 1) {
    
    } 
    //Triangle
    else if (type == 2) {
    
    } 
    //Line
    else {
    
    }
  }

}