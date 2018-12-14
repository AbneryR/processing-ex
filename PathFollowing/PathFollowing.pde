Path p;
Vehicle v;

void setup(){
  size(800,600);
  background(255);
  v = new Vehicle(random(0, width), random(0, height));
  p = new Path();
}

void draw(){
  background(255);
 p.display();
 v.run();
 v.follow(p);
}