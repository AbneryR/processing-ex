class Tire{
  Body body;
  float x,y;
  float r;
  float lifespan =255;
  
  
  Tire(float x_, float y_, float r_){
    x=x_;
    y=y_;
    r=r_;
    
   
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(new Vec2(x,y)));
    body = box2d.createBody(bd);
  
    CircleShape cs = new CircleShape();
    float box2dR = box2d.scalarPixelsToWorld(r);
    cs.m_radius = box2dR;
    
    FixtureDef fd = new FixtureDef();
    fd.shape = cs; 
    fd.density = 1;
    fd.restitution = 0.5;
    fd.friction = 0.9;
    body.createFixture(fd);
    
  }
  
  void killBody(){
      box2d.destroyBody(body);
   }
   
   void live(){
   lifespan--;
   }
  
  boolean done(){
    Vec2 pos= box2d.getBodyPixelCoord(body);
    /* 
    if(lifespan)<0.0{
      killBody();
      return true;
    }
    return false;
    */
    if(pos.y > height+r*2){
      killBody();
      return true;
    }
    return false;
    
  }
  
  void display(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    
    pushMatrix();
    ellipseMode(CENTER);
    translate(pos.x,pos.y);
    rotate(-a);
    fill(117);
    stroke(0);
    ellipse(0,0,r*2,r*2);
    popMatrix();
    
    
  }

}