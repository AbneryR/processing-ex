float angle= 0;
float angVel=.35;
float amplitude= 150;


void setup(){
size(800,600);
background(255);
noStroke();
fill(125, 170);

for(int x=0; x<= width; x+=8){
float y = amplitude *sin(angle);
ellipse(y+width/2, x, 30,30);
angle +=angVel;

}
}

void draw(){

}