class ComplexForm{
Body body;
float w,h,r;
float lifespan = 255;

  ComplexForm(float x, float y, float w_, float h_, float r_){
    w=w_;
    h=h_;
    r=r_;
    
    BodyDef bd= new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    body = box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dW,box2dH);
    
    CircleShape cs = new CircleShape();
    Vec2 offset =new Vec2(0,-h);//OFFSET PARA CAMBIAR LA POSICION LOCAL DEL CIRCULO
    offset = box2d.vectorPixelsToWorld(offset);//
    cs.m_p.set(offset.x,offset.y);//
    cs.m_radius= box2d.scalarPixelsToWorld(r);
    
    body.createFixture(ps, 1.0);
    body.createFixture(cs, 1.0);
     
  }
  
  void run(){
  display();
  live();
  }
  
  void live(){
  lifespan--;
  }
  
  boolean isDead(){
  if(lifespan<0.0){
    box2d.destroyBody(body);
    return true;
  }
  return false;
  }
  
  void display(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    
    rectMode(CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(175);
    stroke(0);
    rect(0,0,w,h);
    ellipse(0,-h,r*2,r*2);
    popMatrix();
  }
  
  
  
}