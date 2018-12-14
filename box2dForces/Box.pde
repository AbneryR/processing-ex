class Box{
  Body body;
  float x,y;
  float w,h;
  
  Box(float x_, float y_, float w_, float h_){
    x=x_;
    y=y_;
    w=w_;
    h=h_;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.setPosition(box2d.coordPixelsToWorld(x,y));
    body = box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dW,box2dH);
    
    body.createFixture(ps,1);
    
  }
  
  void display(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(a);
    fill(175);
    noStroke();
    rect(0,0,w,h);
    popMatrix();
  }
  
  
  void applyForce(Vec2 force){
    Vec2 pos = body.getWorldCenter();
    body.applyForce(force, pos);
  }
  
  

}