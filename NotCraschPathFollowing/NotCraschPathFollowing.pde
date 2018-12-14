  ArrayList<Vehicle> vehicles;
  Path p;

void setup(){
  size(800,600);
  background(255);
  vehicles = new ArrayList<Vehicle>();
  for(int i = 0; i<100; i++){
    vehicles.add(new Vehicle(random(width),random(height)));
  }
  p = new Path();
}


void draw(){
  background(255);
  p.display();
  for(Vehicle v : vehicles){
    v.update();
    
    v.display();
    //v.seek(new PVector(mouseX,mouseY));
    v.separate(vehicles);
    //v.cohesion(vehicles);
    v.follow(p);
    v.checkedges();
  }
  
}

void mouseClicked(){

  p.addPoint(mouseX,mouseY);
}