
void setup(){
size(800,600);
background(255);

}

void draw(){
  background(255);
float amplitude = 100;
float period = 120;
translate(width/2, height/2);
float x = amplitude * cos(TWO_PI * frameCount /period);
float y = amplitude * sin(TWO_PI * frameCount /period);

line(0,-120,0,y);

ellipse(0, y, 30,30);
}