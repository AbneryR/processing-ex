class Surface{
  Body body;
  ArrayList<Vec2> surface;
  
  
  Surface(){
    surface = new ArrayList<Vec2>();
    float n=random(1);
    
    for(float xs = width+10; xs>-10; xs-=5){
      surface.add(new Vec2(xs,map(noise(n),-1,1,0,height)));
      n+=.01;
    }
    
    ChainShape chain = new ChainShape();
    Vec2[] vertices = new Vec2[surface.size()];
    for (int i = 0; i<vertices.length; i++){
      vertices[i] = box2d.coordPixelsToWorld(surface.get(i));
    }
    
    chain.createChain(vertices, vertices.length);
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(0,0);
    body = box2d.world.createBody(bd);
    body.createFixture(chain,1);
  }
  
  void display(){
  strokeWeight(2);
  stroke(0);
  noFill();
  beginShape();
  for(Vec2 v:surface){ vertex(v.x,v.y);}
    endShape();
  }


}