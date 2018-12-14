class Mover{
  //Necesitamos mantener pista de un cuerpo y radio
  Body body;
  float r;
  
  Mover(float r_, float x, float y){
  r= r_;
  //Definimos un cuerpo
  BodyDef bd = new BodyDef();
  bd.type = BodyType.DYNAMIC;
  //Preparamos su posición
  bd.position = box2d.coordPixelsToWorld(x,y);
  body = box2d.world.createBody(bd);
  
  //Hacer la forma del cuerpo un circulo
  CircleShape cs = new CircleShape();
  cs.m_radius = box2d.scalarPixelsToWorld(r);
  
  //Define a fixture
  FixtureDef fd = new FixtureDef();
  fd.shape = cs;
  
  //Parametros que afectan la fisica
  fd.density=1;
  fd.friction= 0.3;
  fd.restitution = 0.5;
  
  body.createFixture(fd);
  
  body.setLinearVelocity(new Vec2(random(-5,5),random(-5,5)));
  body.setAngularVelocity(random(-1,1));
  }

  void applyForce(Vec2 v){
    body.applyForce(v, body.getWorldCenter());
  }
  
  void display(){
    // Vemos a cada cuerpo y obtenemos su posición en pantalla
    Vec2 pos = box2d.getBodyPixelCoord(body);
    //Obtenemos su angulo de rotación
    
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(a);
    fill(150);
    stroke(0);
    strokeWeight(1);
    ellipse(0,0,r*2,r*2);
     //agregamos una linea para que podamos ver la rotación
     line(0,0,r,0);
     popMatrix();
    }

}