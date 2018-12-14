class Oscillator{
  PVector ang;
  PVector vel;
  PVector amp;
  float w;
  float h;
  float r,g,b;
  
  Oscillator(float r_,float g_,float b_, float vel_, float amp_ ){
  ang = new PVector();
  vel = new PVector(vel_, vel_);
  amp = new PVector(-amp_, amp_);
  r= r_;
  g= g_;
  b= b_;  
  }
  
  void oscillate(){
  ang.add(vel);
  }

  void display(){
  float x = sin(ang.x)*amp.x;
  float y = sin(ang.y)*amp.y;
  pushMatrix();
  translate(width/2,height/2);
  stroke(0);
  fill(r,g,b,150);
  line(0,0,x,y);
  ellipse(x,y,16,16);
  popMatrix();
  }

}