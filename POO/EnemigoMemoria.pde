class EnemigoMemoria extends Enemigos{
  
  EnemigoMemoria(PVector location){
   super(location);
  }
  
  void run(Jugador p){
  super.run(p);
  }
  
  void attack(Jugador p){
    super.attack(p);
  //SE ESPECIFICA EL CODIGO DE MEMORIA
  }
  
  void display(){
    //OVERRIDE PARA CAMBIAR LA APARIENCIA DE ENEMIGO DE SECUENCIA
    fill(60,70,255);
    ellipse(loc.x,loc.y,15,15);
  }
  
}