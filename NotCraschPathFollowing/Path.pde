class Path{
ArrayList<PVector> points;
float radius;
  Path(){
  points= new ArrayList<PVector>();
  points.add(new PVector(width/10,height/10));
  points.add(new PVector(width/10,height-height/7));
  //points.add(new PVector(width-width/10,height-height/10));
  //points.add(new PVector(width-width/10,height/10));
  //points.add(new PVector(width/10,height/10));
  radius = 30;
}

  void display(){
    noFill();
    beginShape();
    strokeWeight(radius*2);
    stroke(175);
    for(PVector p : points){
    vertex(p.x,p.y);
    }
    endShape();
    strokeWeight(3);
    stroke(0);
    beginShape();
    for(PVector p : points){
    vertex(p.x,p.y);
    }
    endShape();
  }

  void addPoint(float x, float y){
    points.add(new PVector(x,y));
  }
}