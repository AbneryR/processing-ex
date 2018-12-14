class Curvy{
 ArrayList<Vec2> surface;
 
Body body;
  
  Curvy(){
  //Arreglo de vectores para la superficie 
    surface = new ArrayList<Vec2>();
    float n =random(1);
    for(float x = width+10; x>-10; x-=5){
    surface.add(new Vec2(x, map(noise(n), -1, 1, 75, height-10)));  
    //surface.add(new Vec2(x, map(cos(n), -1, 1, 75, height-10)));  
    n+=.1;//PERLIN
    //n+=.02;//sine
    
    }
    //SHAPEDEF
    ChainShape chain = new ChainShape();
    //SHAPE CON
    Vec2[] vertices = new Vec2[surface.size()];
    for(int i=0; i <vertices.length; i++){
      vertices[i] =box2d.coordPixelsToWorld(surface.get(i));
    }
    
    //createChain
    chain.createChain(vertices, vertices.length);
    

    //BODYDEF
    BodyDef bd = new BodyDef();
    bd.position.set(0,0);
    body = box2d.world.createBody(bd);
    body.createFixture(chain,1);
    
    
    ////FIXDEF
    //FixtureDef fd = new FixtureDef();
    //fd.shape = chain;
    //fd.density = 1;
    //fd.friction = 0.3;
    //fd.restitution = 0.5;
  }
  
  void display(){
    strokeWeight(2);
    stroke(0);
    noFill();
    beginShape();
    for(Vec2 v: surface){ vertex(v.x,v.y);}
    endShape();
  }

}