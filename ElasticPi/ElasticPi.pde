long collisions = 0;
int rate = 1;
Box b1 = new Box(1, 200, 0);
Box b2 = new Box(10000, 800, -1);
boolean wallCollide = true;

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
  text(collisions, 100, 100);
  
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if(e == -1){
    rate++; 
  }
  else if (e == 1){
    rate--; 
  }
  if(rate < 0){
    rate = 0;
  }
}