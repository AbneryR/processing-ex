Flock f;
  
void setup(){
  size(800,600);
  background(255);
  f = new Flock();
}

void draw(){
  background(255);  
  f.run();
}

void mouseClicked(){
  Boid b = new Boid(mouseX,mouseY);
  f.addBoid(b);
}