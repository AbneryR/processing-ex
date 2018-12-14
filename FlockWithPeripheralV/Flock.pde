class Flock {
  ArrayList<Boid> boids;
  
  Flock(){
    boids = new ArrayList<Boid>();
  }
  
  void run(ArrayList<Boid> boids){
    for(Boid b : boids){
      b.run(boids);
    }
  }
  
  
  void addBoid(Boid b){
    boids.add(b);
  }
  
}