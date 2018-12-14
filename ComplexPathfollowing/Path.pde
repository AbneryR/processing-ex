class Path{

ArrayList<PVector> points;
float radius;

  Path() {
  radius = 20;
  points = new ArrayList<PVector>();
  
  }
  
  void addPoint(float x ,float y){
    PVector point = new PVector(x,y);
    points.add(point);
  }
  
  void run(){
    update();
    display();
  }
  
  void groupseek(){
  }
  
  void seek(PVector target){
     PVector desired = PVector.sub(target, loc);
     if(desired.mag() == 0) return;
       desired.normalize();
       desired.mult(1);
       PVector steer = PVector.sub(desired, vel);
       steer.limit(.02);
       applyForce(steer);
  }
  
  void display(){
    stroke(0);
    noFill();
    beginShape();
    for(PVector v : points){
        vertex(v.x,v.y);
    }
    endShape();
  }

}