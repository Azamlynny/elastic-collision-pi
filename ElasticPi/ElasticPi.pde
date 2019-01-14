long collisions = 0;
int rate = 1;
Box b1 = new Box(1, 200, 0);
Box b2 = new Box(100000000, 800, -1);
boolean wallCollide = true;
boolean done = false;

void setup(){
  size(1000, 1000);
  frameRate(60);
}

void draw(){
 drawEnv(); 
 for(int i = 0; i < rate; i++){
   b2.checkCollision();
   b1.checkWallCollision();
   b1.nextPos();
   b2.nextPos();
 }
 if(b2.velocity > 0 && Math.abs(b1.velocity) < b2.velocity){
   
 }
}

void drawEnv(){
  background(0);
  stroke(255);
  fill(0);
  rect(0,1000 - 200,1500,200);
  rect(0,0,1,1000);
  b1.drawBox();
  b2.drawBox();
  fill(255);
  text("Collisions", 30,100);
  text(Long.toString(collisions), 100, 100);
  text("PI", 30,120);
  text("3.14159265358979323", 100, 120);
  text("Speed Box 1", 30, 900);
  text(Double.toString(b1.velocity), 120, 900);
  text("Speed Box 2", 30, 920);
  text(Double.toString(b2.velocity), 120, 920);
  text("Calculation Rate", 800, 100);
  text(Long.toString(rate), 900,100);
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if(e == -1){
    rate =(int) ((rate + 1) * 1.1); 
  }
  else if (e == 1){
    rate = (int) ((rate - 1) / 1.1); 
  }
  if(rate < 0){
    rate = 0;
  }
  if(rate > 10000000){
    rate = 10000000; 
  }
}