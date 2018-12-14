class Box{
  Body body;
  float x,y;
  float w,h;
  
  
  Box(float x_, float y_, float w_, float h_, boolean movil){
    x=x_;
    y=y_;
    w=w_;
    h=h_;
    
    BodyDef bd = new BodyDef();
    if(movil)
    bd.type = BodyType.DYNAMIC;
    else
     bd.type = BodyType.STATIC;
     
    bd.setPosition(box2d.coordPixelsToWorld(new Vec2(x,y)));
    body = box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w);
    float box2dH = box2d.scalarPixelsToWorld(h);
    ps.setAsBox(box2dW,box2dH);
    
    FixtureDef fd = new FixtureDef();
    fd.restitution = 0.5;
    fd.friction = 0.7;
    fd.shape = ps;
    fd.density= 1;
    
    body.createFixture(ps,1.0);
    body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
    body.setAngularVelocity(random(-5, 5));
  }

    void display(){
    Vec2 pos = new Vec2(box2d.getBodyPixelCoord(body));
    float a = body.getAngle();
    pushMatrix();
    rectMode(CENTER);
    translate(pos.x,pos.y);
    rotate(-a);
    fill(127,100);
    stroke(0);
    rect(0,0,w*2,h*2);
    popMatrix();
    }
    
    boolean contains(float mousex, float mousey){
      Vec2 worldPoint = box2d.coordPixelsToWorld(mousex,mousey);
      Fixture f = body.getFixtureList();
      boolean inside = f.testPoint(worldPoint);
      return inside;
    }
}