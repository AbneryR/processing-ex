class UniqueShape{
  Body body;
  float x,y;
  float lifespan = 255;
  float r,g,b;
  UniqueShape(float x_, float y_){
    x=x_;
    y=y_;
    r= random(255);
    g=random(60);
    b= random(180);
    
    float vec1 = random(20);
    float vec2 = random(20);
    float vec3 = random(20);
    float vec4 = random(20);
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));//convertir coordenadas de pixeles a mundo
    body = box2d.world.createBody(bd);
    
    
    
    Vec2[] vertices = new Vec2[5]; // 4 VERTICES
    //int sides= (int)random(3,8); // RANDOM
    //Vec2[] vertices = new Vec2[sides];//random
    //for(int i =0; i<sides; i++) //RANDOM
    //vertices[i] = box2d.vectorPixelsToWorld(new Vec2(random(-10,10),random(-10,10)));//random
    
    
    /*    
    vertices[0] = box2d.vectorPixelsToWorld(new Vec2(-vec1,vec3));
    vertices[1] = box2d.vectorPixelsToWorld(new Vec2(vec2,vec4));
    vertices[2] = box2d.vectorPixelsToWorld(new Vec2(vec3,-vec2));
    vertices[3] = box2d.vectorPixelsToWorld(new Vec2(-vec4,-vec1));
        */
    
    vertices[0] = box2d.vectorPixelsToWorld(new Vec2(10,-10));
    vertices[1] = box2d.vectorPixelsToWorld(new Vec2(-10,-10));
    vertices[2] = box2d.vectorPixelsToWorld(new Vec2(-15,10));
    vertices[3] = box2d.vectorPixelsToWorld(new Vec2(0,20));
    vertices[4] = box2d.vectorPixelsToWorld(new Vec2(15,10));
    
    PolygonShape ps = new PolygonShape();
    ps.set(vertices, vertices.length); // Hacer polygono del arreglo
    body.createFixture(ps, 1.0);
    
    body.setLinearVelocity(new Vec2(random(-5,5),random(2,5)));
    body.setAngularVelocity(random(-5,5));
  }
  
  void run(){
  display();
  live();
  }
  
  void live(){
  lifespan--;
  }
  
  boolean isDead(){
  if(lifespan <0){
    box2d.destroyBody(body);
    return true;
  }
  return false;
  }
  
  void display(){
  Vec2 pos = box2d.getBodyPixelCoord(body);
  float a = body.getAngle();

  Fixture f = body.getFixtureList(); // get fixture
  PolygonShape ps = (PolygonShape) f.getShape(); // get shape attached to the fixture
 
  rectMode(CENTER);
  pushMatrix();
  translate(pos.x, pos.y);
  rotate(-a);
  fill(r,g,b, lifespan);
  //stroke(0, lifespan);
  //fill(175);
  noStroke();
  beginShape();
  for(int i = 0; i< ps.getVertexCount(); i++){
    Vec2 v = box2d.vectorWorldToPixels(ps.getVertex(i));
    vertex(v.x,v.y);
  }
  endShape(CLOSE);
  popMatrix();
  }
  
}