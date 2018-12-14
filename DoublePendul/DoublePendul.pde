Pendulum [] pendulums = new Pendulum[5];

void setup(){
size(800,600);
background(255);
pendulums[0]=new Pendulum(new PVector(width/2,10),125);
for(int i=1; i<pendulums.length; i++) pendulums[i]= new Pendulum(pendulums[i-1],random(60, 150));
}

void draw(){
  background(255);
 for(int i=0; i<pendulums.length;i++) pendulums[i].go(); 

}