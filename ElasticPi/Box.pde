class Box{
  double velocity = 0; // meters/second
  double x = 0; //meters
  double mass = 1; //kilograms
  
  public Box(double m, double xPos, double v){
    mass = m;
    x = xPos;
    velocity = v;
  }
  
  void drawBox(){
    rect((float)x, 700, 100, 100);
  }
  
  void nextPos(){
    x += velocity;
    checkCollision();
    if(b2.x <= 100){
      b2.x = 100; 
    }
  }
  
  void checkCollision(){
    if(b2.x <= b1.x + 100 && wallCollide == true){
      collide();
    }
  }
  
  void collide(){
    collisions++;
    wallCollide = false;
    double tempV2 = b2.velocity;
    b2.velocity = (b2.mass - b1.mass)/(b2.mass + b1.mass) * b2.velocity + (2 * b1.mass)/(b2.mass + b1.mass) * b1.velocity;
    b1.velocity = (b1.mass - b2.mass)/(b2.mass + b1.mass) * b1.velocity + (2 * b2.mass)/(b2.mass + b1.mass) * tempV2;
  }
  
  void checkWallCollision(){
    if(b1.x <= 0){
      collisions++;
      b1.velocity = b1.velocity * -1;
      wallCollide = true;
    }
  }
}