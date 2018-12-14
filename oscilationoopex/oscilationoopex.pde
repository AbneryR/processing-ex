Wave [] wave= new Wave[10];

void setup(){
size(800,600);
background(255);
for(int i=0;i<wave.length;i++)wave[i]= new Wave(new PVector(random(width),random(height)), 300, random(100), random(500));

}

void draw(){
  background(255);
for(int i=0;i<wave.length;i++){
wave[i].calculate();
wave[i].display();
}
}