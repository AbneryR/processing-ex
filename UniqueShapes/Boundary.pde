class Boundary{
  ArrayList<Vec2> surface;
  
  Boundary(){
  surface = new ArrayList<Vec2>();  
  float n=random(1);
  for(int i = 0; i<60; i++){
    surface.add(new Vec2(width/60*i, map(noise(n), -1, 1, 0, height)));
    n+=.09;
  }
  
  ChainShape chain = new ChainShape();
  
  Vec2[] vertices = new Vec2[surface.size()];
  
  for (int i = 0 ; i<vertices.length; i++){
    vertices[i] = box2d.coordPixelsToWorld(surface.get(i)); //convertir las posiciones de pixeles a box2d
  }
  
  chain.createChain(vertices, vertices.length);
  
  BodyDef bd = new BodyDef();
  Body body = box2d.world. createBody(bd);
  body.createFixture(chain, 1);
  
  }
  
  void display(){
  strokeWeight(2);
  stroke(255);
  noFill();
  beginShape();
  for(Vec2 v: surface){
    vertex(v.x,v.y);
 //   ellipse(v.x, v.y, 10,10);
  }
  endShape();
  }
  
  
  

}