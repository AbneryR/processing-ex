Wehicle we;
Target tar;
ArrayList<Ambiente> ambs;

void setup(){
size(800,600);
background(255);
we = new Wehicle(new PVector(10,10));
tar= new Target(new PVector(10,10), true);
ambs = new ArrayList<Ambiente>();
ambs.add(new Ambiente(new PVector(0,0),width/2,height/2, 10, 1));
ambs.add(new Ambiente(new PVector(width/2,0),width/2,height/2, .5, .01));
ambs.add(new Ambiente(new PVector(0,height/2),width/2,height/2, 5, 0.5));
//ambs.add(new Ambiente(new PVector(width/2,height/2),width/2,height/2), 4,);
}

void draw(){
  background(255);
  we.run();
  tar.run();
  we.seek(tar);
  for(Ambiente a: ambs){
  a.display();
  we.checkEnviroment(a);
  }

}