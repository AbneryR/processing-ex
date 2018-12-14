class Boundary{
  Body body;
  float x,y;
  float w,h;
  
  Boundary(float x_ , float y_, float w_, float h_){
    x=x_;
    y=y_;
    w=w_;
    h=h_;
  
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.angle = PI/2;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    
    body = box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    ps.setAsBox(w,h);
    
    body.createFixture(ps,1);
    
  }
  
  void display(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a  = body.getAngle();
    
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(a);
    fill(127);
    stroke(0);
    strokeWeight(2);
    rect(0,0,w,h);
    popMatrix();
  }

}