Wehicle wanderer;
boolean debug = true;

void setup(){
size(800,600);
wanderer = new Wehicle(new PVector(100,100));
}

void draw(){
  background(255);
  wanderer.wander();
  wanderer.run();
}