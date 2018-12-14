Mover bob;
Spring spring;

void setup(){
  size(800,600);
  background(235);
  bob = new Mover(width/2, 70, 20);
  spring = new Spring(width/2,30,120);
}

void draw(){
  background(235);
  PVector gravity = new PVector(0,1);
  bob.applyForce(gravity);
  spring.connect(bob);
  bob.update();
  bob.display();
  spring.display();
  spring.displayLine(bob);
}