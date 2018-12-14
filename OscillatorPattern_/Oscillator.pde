class Oscillator{
  PVector ang;
  PVector vel;
  PVector amp;
  PVector acc;
  float w;
  float h;
  float r,g,b;
  
  Oscillator(float r_,float g_,float b_, float ampl_, float vel_){
  ang = new PVector();
  acc = new PVector(.0003,.0002);
  vel = new PVector(vel_, vel_);
  amp = new PVector(-ampl_, random(ampl_));
  r= r_;
  g= g_;
  b= b_;  
  }
  
  void oscillate(){
  vel.add(acc);
  vel.limit(10);
  amp.add(vel);
  ang.add(vel);
  acc.mult(0);
  }

  void display(){
   // amp.x+=.01;
 //   amp.y+=.01;
  float x = cos(ang.x)*amp.x;
  float y = sin(ang.y)*amp.y;
  pushMatrix();
  translate(width/2,height/2);
  noStroke();
  fill(r,g,b,150);
  ellipse(x,y,20,20);
  stroke(150);
  //line(0,0,x,y);
  popMatrix();
  }

}