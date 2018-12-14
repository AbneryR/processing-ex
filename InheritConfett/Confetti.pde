class Confetti extends Particle{

  Confetti(PVector l){
    super(l);
  }
  
  void update(){
    super.update();
  }
  
  void display(){
  float theta = map(loc.x,0,width,0,TWO_PI*2);
  rectMode(CENTER);
  fill(0,lifespan);
  stroke(0,lifespan);
  pushMatrix();
  translate(loc.x,loc.y);
  rotate(theta);
  rect(0,0,10,10);
  popMatrix();
  }
  
  

}