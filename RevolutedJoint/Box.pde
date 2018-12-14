class Box{
Body body;
  float x,y,r;
  float w,h;
  float lifespan=255;
  
  Box(float x_, float y_, float w_, float h_, boolean fixed){
    x=x_;
    y=y_;
    w=w_;
    h=h_;
    //if(active){
   // 
    //}
    
    BodyDef bd = new BodyDef();
    if(fixed)bd.type = BodyType.STATIC; 
    else bd.type = BodyType.DYNAMIC;  
    bd.position.set(box2d.coordPixelsToWorld(new Vec2(x,y)));
    body = box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dW, box2dH);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    //if(fixed) fd.density = 0; 
    //else fd.density=1; //// si es first or last
    fd.density=1;
    fd.restitution= 0.5;
    fd.friction = 0.03;
    body.createFixture(ps,1.0);
    //body.setLinearVelocity(new Vec2(random(-5,5),random(2,5)));
    
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
  
  boolean isDead(){
    if(lifespan<0.0)return true;return false;
  }
  
  void display(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    pushMatrix();
    rectMode(CENTER);
    translate(pos.x,pos.y);
    rotate(-a);
    fill(127, lifespan);
    stroke(0,lifespan);
    strokeWeight(2);
    rect(0,0,w,h);
    popMatrix();
    lifespan--;
  }
  
  
}