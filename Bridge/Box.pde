class Box{
  Body body;
  float w, h;
  float x,y;
  
  Box(float x_, float y_, float w_, float h_){
    x=x_;
    y=y_;
    w=w_;
    h=h_;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(new Vec2(x,y)));
    body = box2d.createBody(bd);
    
    
    PolygonShape ps = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w);
    float box2dH = box2d.scalarPixelsToWorld(h);;
    ps.setAsBox(box2dW, box2dH);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density =1;
    fd.restitution = 0.1;
    body.createFixture(fd);
    
    
  }
  
    void display(){
      Vec2 pos = box2d.getBodyPixelCoord(body);
      
      float a = body.getAngle();
      pushMatrix();
      translate(pos.x, pos.y);
      rotate(a);
      stroke(0);
      fill(127);
      strokeWeight(2);
      rect(0,0,w,h);
      popMatrix();
    }

}