Path p;
Vehicle v;

void setup(){
  size(800,600);
  background(0);
   p = new Path();
   p.addPoint(0, height/3);
   p.addPoint(width/3, height/2);
   v = new Vehicle(random(0,width), random(0,height));
}


void draw(){
  background(255);
  
  p.display();
  v.run();
  v.follow(p);

}

void mouseClicked(){

  p.addPoint(mouseX,mouseY);
}