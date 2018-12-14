import controlP5.*;

ControlP5 noiseAmount;
Slider na;
ArrayList<Boid> boids;
float noise;
float i;
float theta=0;
float in;
  
void setup(){
  size(800,600);
  background(255);
  boids = new ArrayList<Boid>();
  for(int i = 0; i<10; i++)
    boids.add(new Boid(random(width), random(height)));
  i=random(1);
  noise = noise(i);
  noiseAmount = new ControlP5(this);
  noiseAmount.addSlider("i").setPosition(100,50).setRange(0,1).setValue(i);
  //noiseAmount.getController("slider").getValueLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  //noiseAmount.getController("slider").getCaptionLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  
}

void draw(){
  background(255);
  
  float r=100;
  text(theta, width/2, height/3);
  theta=45;
  for(Boid b : boids){
    b.run(boids);
    b.flock(boids, noise);
  }
  i+=.01;
  
}