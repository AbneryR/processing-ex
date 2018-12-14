class BridGen{
  ArrayList<Particle> particles;
  
  float distance; 
  float x,y;
  Particle p = null;
  
  BridGen(float x_, float y_, float wh_){
    x = x_;
    y = y_;
    distance = wh_;
    particles = new ArrayList<Particle>();
    int nodes =(int) distance / 10;
    float len = distance/ nodes;
    
    for(int i=0 ; i<nodes-1; i++){
      if(i==0| i==nodes-2)
      particles.add(new Particle((i*len),y,5,true));
      else
      particles.add(new Particle((i*len),y,5,false));
    
    if(i>0){
      DistanceJointDef djd = new DistanceJointDef();
      Particle previous = particles.get(i-1);
      p= particles.get(i);
      djd.bodyA = previous.body;
      djd.bodyB = p.body;
      djd.length = box2d.scalarPixelsToWorld(len);
      djd.frequencyHz=0;
      djd.dampingRatio=0;
      DistanceJoint dj = (DistanceJoint) box2d.world.createJoint(djd);
    }
  
}
   
    
}
  
    void display(){
    for(int i = 0; i<particles.size()-1; i++){
    p = particles.get(i);
    Vec2 pos1 = box2d.getBodyPixelCoord(p.body);
    p = particles.get(i+1);
    Vec2 pos2 = box2d.getBodyPixelCoord(p.body);
    line(pos1.x,pos1.y,pos2.x,pos2.y);  
      }
    for(Particle d : particles){
    d.display();
    }
    }
  
}