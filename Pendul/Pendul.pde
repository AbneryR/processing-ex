Pendulum p;

void setup(){
size(800,600);
background(255);
p=new Pendulum(new PVector(width/2,10),125);
}

void draw(){
  p.go();

}