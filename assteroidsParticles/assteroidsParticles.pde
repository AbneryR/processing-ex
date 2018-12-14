Spaceship s;

void setup(){
size(300,300);
s = new Spaceship( width/2, height/2);
}

void draw(){  
  background(255);
  s.display();
  s.update();
  s.drag();
  s.wrapedges();
  
  if(keyPressed){
      if(key == 'z'){
          s.thrust();
      }
      if(key == 'a'){
        s.angle +=.05;
      }
      if(key == 'd'){
        s.angle -=.05;
      }
 }
  
}