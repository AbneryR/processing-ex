class Box{
  Body body;
  float rad;
  float x,y;
  float lifespan= 1005;
  
  
  Box(float x_, float y_, float rad_){
  x= x_;
  y= y_;
  rad= rad_;
  
  BodyDef bd = new BodyDef();
  bd.type = BodyType.DYNAMIC;
  bd.position.set(box2d.coordPixelsToWorld(x, y));
  body = box2d.world.createBody(bd);
  
   CircleShape cs = new CircleShape();
   //cs.m_p.set(bd.position);
   cs.m_radius = box2d.scalarPixelsToWorld(rad);
   
   FixtureDef fd = new FixtureDef();
   fd.shape = cs;
   fd.density = 1;
   fd.restitution = 0.5;
   fd.friction=0.01;
   body.createFixture(fd);
   
   //body.setLinearVelocity(new Vec2(random(-1f,1f),random(.5f,1f)));
   //body.setAngularVelocity(random(-1,1));
  }
  
  void display(){
  Vec2 pos = box2d.getBodyPixelCoord(body);
  float a = body.getAngle();
  pushMatrix();
  translate(pos.x,pos.y);
  rotate(-a);
  ellipseMode(CENTER);
  stroke(0,lifespan);
  fill(175,lifespan);
  ellipse(0,0, rad*2, rad*2);
  line(0,0,rad,0);
  popMatrix();
  }
  
  void run(){
  display();
  lifespan--;
  }
  
  void killBody(){
    box2d.destroyBody(body);
  }
  
  boolean done(){
   Vec2 pos = box2d.getBodyPixelCoord(body);
   if(lifespan <0){
     killBody();
     return true;
   }
   return false;
  }

}