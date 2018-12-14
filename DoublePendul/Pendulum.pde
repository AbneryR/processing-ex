class Pendulum{
float r; //radius
float theta; //angulus
float aVel; //angulusVelusutus
float aAcc; //angulusAceleratus
float damping;
PVector loc;
PVector origin;

Pendulum(PVector origin_, float r_){
origin = origin_;
loc=new PVector();
r=r_;
theta = PI/4;
aVel=0.0;
aAcc=0.0;
damping=0.995;
}

Pendulum(Pendulum prev, float r_){
origin = prev.loc;
loc=new PVector();
r=r_;
theta = random(PI);
aVel=0.0;
aAcc=0.0;
damping=0.995;
}


void go(){
update();
display();
}

void update(){
float gravity = 0.4;
aAcc =-1*gravity*sin(theta)/r;
aVel+=aAcc;
theta +=aVel;
aVel*=damping;
}

void display(){
loc.set(r*sin(theta),r*cos(theta),0);
loc.add(origin);

 stroke(0);
fill(175);
line(origin.x,origin.y,loc.x,loc.y);
ellipse(loc.x,loc.y,16,16);
}

}