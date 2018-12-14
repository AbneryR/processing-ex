class Mover{
PVector loc;
PVector acc;
PVector vel;
float angle;

    Mover(){
      loc = new PVector(random(0,width), random(0,height));
      vel = new PVector(0,0);
      acc = new PVector(0,0);
    }
    
    void update(){
    vel.add(acc);
    lkoc.add(vel);
    vel.limit(25);
    acc.mult(0);
    }
    
    void display(){
    angle = atan2(vel.x, vel.y);
    pushMatrix();
    rotate(angle);
    popMatrix();
    }
}

/*

Distorsiona luz y sonido
con su voz y con su mirada
Ella da vida y trae olvido.
Mueve todo sin tocar nada.


Haz mi corazon estallar 
y Ahógame con tus perfumes
Muéstrame la eternidad
O termina conmigo de una vez,
 






No esperaba nada, habia personas que de algun modo significaron algo 
y luego ya no. Ambas por las mismas razones, pero la segunda menos
mala que la primera, igual ya no importa. Ni siquiera sé quien eres y 
solo con estar frente a tí mi corazon se acelera, y para ti seguramente
soy muy x */