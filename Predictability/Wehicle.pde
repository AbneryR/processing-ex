class Wehicle{
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float maxspeed; //el wehiculo se mueve al objetivo deseado una maxima velocidad
  float maxforce; //la steering force se limita según las capacidades del wehiculo y la fuerza maxima que tiene
  //La fuerza de giro puede estar condicionadas con más caracteristicas de nuestro
  //wehiculo como: puntos de vida, energia, felicidad, etc
  
  void run(){
  update();
  display();
  }
  
  Wehicle(PVector loc){
    this.loc = loc;
    vel = new PVector(random(0,1),random(-1,1));
    acc = new PVector(0,0);
    r=3;
    maxspeed =4; //arbitrario
    maxforce = .6; //arbitrarios
}
  
  void update(){ //modelo de movimiento de "integracion de Euler"
    vel.add(acc);
    vel.limit(maxspeed);
    loc.add(vel);
    acc.mult(0);
  }
  
  void seek(Target target){ //Algoritmo de fuerza de busqueda
    PVector predictability= PVector.add(target.loc,target.vel);
    PVector desired = PVector.sub(predictability,loc); //Calcular la velocidad deseada
    //PVector desired = PVector.sub(target.loc,loc);
    float d = desired.mag();
    desired.normalize();
    if(desired.mag()<100)
    {
      float m = map(d,0,100,0,maxspeed );
      desired.mult(m); //Calculando la velocidad deseada al objetivo a maxima vlocidad
    }
    else{
      desired.mult(maxspeed);
  }
    PVector steer = PVector.sub(desired,vel);//Formula de Reynold's :Steering force es igual a velocidad deseada - velocidad actual
    steer.limit(maxforce);
    applyForce(steer);
  }
  
  void flee(Target target){ //Algoritmo de fuerza de busqueda
    PVector desired = PVector.sub(target.loc,loc); //Calcular la velocidad deseada
    desired.normalize();
    desired.mult(-maxspeed); //Calculando la velocidad deseada al objetivo a maxima vlocidad
    PVector steer = PVector.sub(desired,vel);//Formula de Reynold's :Steering force es igual a velocidad deseada - velocidad actual
    steer.limit(maxforce);
    applyForce(steer);
  }
  
  void applyForce(PVector force){
    PVector f = PVector.div(force,r);
    acc.add(f);
  }
  
  void display(){
       float theta = vel.heading() + PI/2; //obtener el angulo de inclinacion según la velocidad a la que se mueve el objeto
       fill(175);
       stroke(0);
       pushMatrix();
       translate(loc.x,loc.y);
       rotate(theta);
       beginShape();
       vertex(0, -r*2);
       vertex(-r, r*2);
       vertex(r,r*2);
       endShape(CLOSE);
       popMatrix();
  }
}