class Waves{
float angle;
float angleVel;
float amplitude;
float startAngle;
PVector pos;

  Waves(float eq, float ye){
  pos = new PVector(eq, ye);
  angle=0;
  angleVel=random(.2);
  amplitude=random(height);
  startAngle=0;
  }

  void display(){
  //for(int x=0; x<=width;x+=8){
  //pos.y=map(noise(angle),-1,1,0,height);
  //ellipse(pos.x, pos.y,10,10);
  //angle +=angleVel;
  stroke(0); 
  fill(0,50); 
  
  ellipse(pos.x, pos.y,30,30);;
   
  }
  
  void update(){
  pos.y=map(noise(angle),-1,1,0,height);
  angle +=angleVel;
  pos.x+=2; }
  
}