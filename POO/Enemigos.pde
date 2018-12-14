class Enemigos{
  PVector loc;
  float vida;
  boolean pelea;
  
  Enemigos(PVector location){
  //SE INICIALIZA LA POSICION Y LA VIDA
  loc=location;
  vida=10;
  pelea = false;
  }
  
  void run(Jugador p){
    //SE AGRUPAN EL ATAQUE Y EL DIBUJADO DEL OPONENTE PARA REDUCIR LA CONFUSION EN MAIN
    attack(p);
    display();
  }
  
  
  void attack(Jugador p){
    //SE CALCULA LA DISTANCIA ENTRE EL JUGADOR Y EL ENEMIGO, LA DISTANCIA ES MENOR AL RADIO DE AMBOS,
    //SIGNIFICA QUE ESTAN PELEANDO
    PVector d = PVector.sub(loc,p.loc);
    float radio = PI* 1.5*1.5;
    if(d.mag()< radio*2){
       p.golpeado();
      //HASTA PROGRAMAR LO DEMÁS, POR LO MIENTRAS SOLO LE BAJA VIDA AL JUGADOR
    //    pelear();
    }
  }
  
  boolean pelear(){   
  return pelea;
  }
  
  
  //Dibuja al enemigo
  void display(){
    fill(100);
    ellipse(loc.x,loc.y,15,15);
    
  }
  
  


}