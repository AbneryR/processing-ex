class Flowfield {
  PVector [] [] field;
  int cols, rows;
  int resolution;
  float xoff, yoff;
  float time;

  Flowfield() {
    resolution = 30;
    cols = width/resolution;
    rows = height/resolution;
    field = new PVector[cols][rows];
    time=0;
    init();
    
  }
  
  void update(){
    
       xoff=0;
  for (int i = 0; i<cols; i++) {
      yoff=0;
      for (int j = 0; j<rows; j++) {
        float theta = map(noise(xoff, yoff, this.time), 0, 1, 0, TWO_PI);
        field[i] [j] = new PVector(sin(theta), cos(theta));
        yoff+=.1;
      }
      xoff+=.1;
    }
    this.time+=.03;
  }
  
  PVector lookup(PVector lookup){
    int column = int(constrain(lookup.x/resolution,0,cols-1));
    int row = int(constrain(lookup.y/resolution,0,rows-1));
    return field[column][row].get();
  }
  
  void init(){
     xoff=0;
  for (int i = 0; i<cols; i++) {
      yoff=0;
      for (int j = 0; j<rows; j++) {
        float theta = map(noise(xoff, yoff), 0, 1, 0, TWO_PI);
        field[i] [j] = new PVector(sin(theta), cos(theta));
        yoff+=.1;
      }
      xoff+=.1;
    }
  }
  
  void display(){
      for (int i = 0; i<cols; i++) {
      for (int j = 0; j<rows; j++) {
        PVector m = field[i][j];
        float theta = m.heading() + TWO_PI; //<>//
        pushMatrix();
        translate(resolution*i,resolution*j);
        rotate(theta);
        line(0, 0, 8, 0);
        popMatrix();
      }
     }   
  }    
}