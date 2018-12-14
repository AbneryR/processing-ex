Oscillator [] oscs= new Oscillator[50];


void setup(){
size(800,600);
background(255);
float amp=0;
float vel=.05;
for(int i= 0; i<50; i++) {
  oscs[i] = new Oscillator(random(0,255), random(0,255),random(0,255), amp, vel);
  amp+= 3;
  vel+= .001;
}
}

void draw(){
  background(255);
for(int i= 0; i<10; i++){
  oscs[i].oscillate();
  oscs[i].display();
  //println(oscs[0].acc.x);
  
}
}