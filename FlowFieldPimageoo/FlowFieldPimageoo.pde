PImage myimage;

void setup(){
  size(900,576,P2D);
  
  myimage = loadImage("conejo.jpg");
  myimage.filter(GRAY);
  myimage.loadPixels();
  
  println(myimage.pixels[1]);
}

void draw(){
  image(myimage, 0,0);
  
  
}