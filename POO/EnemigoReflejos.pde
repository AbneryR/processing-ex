class EnemigoReflejos extends Enemigos{
  
  EnemigoReflejos(PVector location){
   super(location);
  }
  
  void run(Jugador p){
  super.run(p);
  }
  
  void attack(Jugador p){
    super.attack(p);
  //SE ESPECIFICA EL CODIGO DE SECUENCIA
  }
  
  void display(){
    //OVERRIDE PARA CAMBIAR LA APARIENCIA DE ENEMIGO DE SECUENCIA
    fill(155,20,130);
    ellipse(loc.x,loc.y,15,15);
  }
  
}