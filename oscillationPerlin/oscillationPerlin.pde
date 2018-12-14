float angle=0;
float angleVel=0.2;
float amplitude=100;
float startAngle=0;
void setup(){

size(400,200);
background(255);

stroke(0);
strokeWeight(2);
noFill();


}

void draw(){
  background(255);
   angle = startAngle;
  
//beginShape();
for(int x=0; x<=width;x+=8){
  float y=map(noise(angle),-1,1,0,height);
  ellipse(x,y,10,10);
  angle +=angleVel;
}
startAngle+=0.02;
//endShape();
}