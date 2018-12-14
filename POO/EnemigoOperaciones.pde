class EnemigoOperaciones extends Enemigos{
  
  EnemigoOperaciones(PVector location){
   super(location);
  }
  
  void run(Jugador p){
  super.run(p);
  }
  
  void attack(Jugador p){
    super.attack(p);
  //SE ESPECIFICA EL CODIGO DE Operaciones
  }
  
  void display(){
    //OVERRIDE PARA CAMBIAR LA APARIENCIA DE ENEMIGO DE SECUENCIA
    fill(40,255,55);
    ellipse(loc.x,loc.y,15,15);
  }
  
}