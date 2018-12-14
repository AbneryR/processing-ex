  ArrayList<Vehicle> vehicles;


void setup(){
  size(800,600);
  background(255);
  vehicles = new ArrayList<Vehicle>();
  for(int i = 0; i<100; i++){
    vehicles.add(new Vehicle(random(width),random(height)));
  }
}


void draw(){
  background(255);
  for(Vehicle v : vehicles){
    v.update();
    v.display();
   v.seek(mouseX,mouseY);
    v.separate(vehicles);
  }
  
  
}