Wehicle we;
Target tar;
boolean seeking;

void setup(){
  size(800,600);
  background(255);
  we= new Wehicle(new PVector(width/3,height/2));
  tar= new Target(new PVector(width/2, height/2), true);
}

void draw(){
  background(255);
  
  we.run();
  if(seeking)
    we.seek(tar.loc);
  else
    we.flee(tar.loc);
  tar.run();
  texto();
}

void keyPressed(){
  if(keyPressed)
    seeking = !seeking;
}

void texto(){
  fill(0);
  if(seeking)
    text("Buscando", tar.loc.x, tar.loc.y-10);  
  else
    text("Huyendo", tar.loc.x, tar.loc.y-10);
}