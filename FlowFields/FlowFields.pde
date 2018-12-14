
Flowfield flow;
ArrayList<Vehicle> v;

float noiseScale = 0.02;
float time = .01;
int i,j,k;
void setup() {
  size(800, 600);
  background(255);
  flow = new Flowfield();
  v = new ArrayList<Vehicle>();  
  for (int i = 0; i<20; i++) {
    v.add(new Vehicle());
  }
 i=1;
 j=1;
 k=1;
}

void draw() {
  background(255);
  for (Vehicle n: v) {
    n.run();
    n.follow(flow);
  }
  flow.update();
  flow.display();
 
}