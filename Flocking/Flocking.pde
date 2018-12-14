ArrayList<Boid> boids;
float noise;
float i;
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
  
  for(Boid b : boids){
    b.run();
    b.flock(boids, noise);
  }
  i+=.01;
  
}