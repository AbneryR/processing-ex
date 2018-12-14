ArrayList<Boid> boids;
float noise;
float i;
float theta=0;
  
void setup(){
  size(800,600);
  background(255);
  boids = new ArrayList<Boid>();
  for(int i = 0; i<30; i++)
    boids.add(new Boid(random(width), random(height)));
  i=random(1);
  noise = noise(i);
}

void draw(){
  background(255);
  
  float r=100;
  beginShape();
  vertex(width/2+r*cos(theta), height/2- r*sin(theta)/2);
  vertex(width/2, height/2);
  vertex(width/2+r*cos(theta), height/2+ r*sin(theta)/2);
  endShape(CLOSE);
  text(theta, width/2, height/3);
  theta=45;
  for(Boid b : boids){
    b.run();
    b.flock(boids, noise);
  }
  i+=.01;
  
}