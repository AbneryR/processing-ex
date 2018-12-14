Wehicle wanderer;
boolean debug = true;

void setup(){
size(800,600);
wanderer = new Wehicle(new PVector(width/2,height/2));
}

void draw(){
  background(255);
  wanderer.wander();
  wanderer.run();
}

void mousePressed(){
  debug= !debug;
}