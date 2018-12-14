/*
class Boundary{
  Body body;
  ArrayList<Vec2> vectors;
  Boundary(){
    float n=random(1);
    for(float x=width; x>0; x-=15  ){
     vectors.add(new Vec2(x, map(noise(n), -1, 1, 0, height)));
     n+=0.05;
    }
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.setPosition(new Vec2(0,0));
    body = box2d.createBody(bd);
    
    FixtureDef fd = new FixtureDef();
    
  }


}

*/