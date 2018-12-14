PImage myimage;

void setup(){
  size(900,576,P2D);
  
  myimage = loadImage("conejo.jpg");
  myimage.filter(THRESHOLD, 0.3);
}

void draw(){
  image(myimage, 0,0);
  
  
}