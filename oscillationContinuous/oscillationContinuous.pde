float angle= 0;
float angVel=.5;
float amplitude= 50;


void setup(){
size(800,600);
background(255);
stroke(1);
noFill();
//fill(125, 170);

for(int x=0; x<= width; x+=8){
float y = amplitude *sin(angle);
ellipse(x, y+height/2, 30,30);
angle +=angVel;

}
}

void draw(){

}