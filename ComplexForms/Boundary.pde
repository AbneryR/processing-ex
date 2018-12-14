class Surface{
Body body;
float w, h;
float x,y;  
  Surface(float x_, float y_, float w_, float h_){
  w= w_;
  h= h_;
  x=x_;
  y=y_;
  BodyDef bd = new BodyDef();
  bd.type = BodyType.STATIC;
  bd.position = box2d.coordPixelsToWorld(x,y);
  body = box2d.createBody(bd);
  
  PolygonShape ps = new PolygonShape();
  float box2dW = box2d.scalarPixelsToWorld(w/2);
  float box2dH = box2d.scalarPixelsToWorld(h/2);
  ps.setAsBox(box2dW, box2dH);
  
  body.createFixture(ps,1);
  }
  
  void display(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    //float a = body.getAngle();
    
    rectMode(CENTER);
    fill(175);
    stroke(0);
    rect(pos.x,pos.y, w, h);
    
  }

}