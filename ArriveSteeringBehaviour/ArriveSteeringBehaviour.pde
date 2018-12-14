Target tar;
Wehicle we;


void setup(){
  size(800,600);
  background(255);
  tar = new Target();
  we = new Wehicle(new PVector(width/2,height/2), 6);
  
}

void draw(){
  background(255);
  we.run();
  we.wander();
}