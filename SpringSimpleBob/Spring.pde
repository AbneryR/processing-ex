class Spring{
PVector anchor;
float len;
float k;
 Spring(float x,float y, int l){
 k=0.1;
 anchor = new PVector(x,y);
 len= l;
 }
 
 void connect(Mover bob){
 PVector force= PVector.sub(bob.loc,anchor);
 float d = force.mag();
 float x= d - len;
 force.normalize();
 force.mult(-1*k*x);
 bob.applyForce(force);
 }
 
 void display(){
   fill(100);
   rectMode(CENTER);
   rect(anchor.x, anchor.y,10,10);
 }
 void displayLine(Mover bob){
   stroke(255);
   line(bob.loc.x, bob.loc.y, anchor.x,anchor.y);
 }

}