PVector a;
PVector b;

void setup(){
  size(800,600);
  background(255);
  
  a= new PVector(1,0);//PVector.random2D();
  b= new PVector(0,-1);//PVector.random2D();
  a.mult(200);
  b.mult(200);
  
}

void draw(){
  background(255);
  strokeWeight(4);
  a = new PVector(map(mouseX,0, width, -width/2, width/2), map(mouseY, 0, height, -height/2, height/2));
  line(width/2,height/2, (width/2)+ a.x, (height/2)+a.y);
  line(width/2,height/2, (width/2)+ b.x, (height/2)+b.y);
  // the angle is equal to the arccos of the division between A dot B and the product of a magnitude times b magnitude
  // if two vectors are perpedicular, the a dot b is equal to 0
  //if two vectors are unit vecctors, then the dot product is equal to the cosine of the angle between them  a dot b = cos(theta)
  // WE USE DOT PRODUCT TO FIN THE ANGLE BETWEEN TWO VECTORS
  // The product is equal to (a.x*b.x)+(a.y*b.y)
  //The product a dot b is equal to a.mmagnitude times b.magnitude times cos(theta)
  // cos(theta) = a.dot(b) / (||A|| x ||b||)
  //then 
  // theta = arcsin(a.dot(b) / (||A|| x ||b||))
  float theta = acos(a.dot(b)/ (a.mag()*b.mag()));
  
  fill(0);
  stroke(0);
  //strokeWeight(1);
  text("radians: "+ theta, 100,100);
  text("degrees: "+degrees(theta), 100,120);
  text("Angle Between: " + degrees(theta), 100,150);
}