class Target{
  PVector loc;
  
  Target(){
    loc = new PVector(mouseX,mouseY);
    
  }
  
  void exist(){
        loc= new PVector(mouseX, mouseY);
        fill(255);
        stroke(0);
        ellipseMode(CENTER);
        ellipse(loc.x,loc.y,10,10);
        line(loc.x-10, loc.y, loc.x+10, loc.y);
        line(loc.x,loc.y-10, loc.x,loc.y+10);
  }

}