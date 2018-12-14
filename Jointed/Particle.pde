class Particle{
Body body;
  float x,y,r;
  
  Particle(float x_, float y_, float r_){
    x=x_;
    y=y_;
    r=r_;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(new Vec2(x,y)));
    body = box2d.createBody(bd);
    
    CircleShape cs = new CircleShape();
    float box2dR = box2d.scalarPixelsToWorld(r);
    cs.m_radius= box2dR;
    
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    fd.density = 1;
    fd.density = 1;
    fd.friction = 0.01;
    body.createFixture(cs,1.0);
    body.setLinearVelocity(new Vec2(random(-5,5),random(2,5)));
    
  }
  
  void killBody(){
      box2d.destroyBody(body);
  }
  
  boolean done(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    
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
    translate(pos.x,pos.y);
    rotate(a);
    fill(127);
    stroke(0);
    strokeWeight(2);
    ellipse(0,0,r*2,r*2);
    line(0,0,r,0);
    popMatrix();
  }
  
  
}