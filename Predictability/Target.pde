class Target{
  PVector loc;
  PVector vel;
  float i,j;
  
  Target(PVector loc){
   this.loc = loc;
  }
  
  Target(PVector loc, boolean moving){
   this.loc = loc;
   vel = new PVector(0,0);
   i=random(1);  
   j=random(1);
 }
  
  
  void run(){
  display();
  move();
  checkEdges();
  }
  
  void move(){
   vel.x= map(noise(i), 0,1,-5,5 );
   vel.y= map(noise(j), 0,1,-5,5 );
    loc.add(vel);
    i+=.1;
    j+=.1;
  }
  
  void display(){
    fill(255);
    stroke(0);
    ellipseMode(CENTER);
    ellipse(loc.x,loc.y,10,10);
    line(loc.x-10,loc.y, loc.x+10,loc.y);
    line(loc.x,loc.y-10, loc.x,loc.y+10);
  }
  
  void checkEdges(){
    if (loc.x<0) { //si la posicion loc.x de este objeto es menor a 0
      loc.x = 0;  //su posición cambia a 0
      vel.x*=-1; // el valor x de su velocidad se invierte para que cambie de dirección con respecto al eje X,
    }
    if (loc.x>width) {
      loc.x = width; 
      vel.x*=-1;
    }
    if (loc.y<0) {
      loc.y = 0; 
      vel.y*=-1;
    }
    if (loc.y>height) {
      loc.y = height; 
      vel.y*=-1;
    }
  
  }
}