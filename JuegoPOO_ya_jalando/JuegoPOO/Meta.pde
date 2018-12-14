public class Meta extends Enemigo{
float tam;
boolean gano;
boolean perdio;
PVector loc;

  Meta(PVector origin, boolean perdio, boolean gano){
  super(origin);
  loc= origin; 
  perdio = false;
  gano = false;
  tam=20;
  }
  
   void run(Jugador player){
    collision(player);
    display();  
  }
  
  //Funcion de rastreo del jugador por separado
  PVector track(Jugador player){
  PVector dir= PVector.sub(player.loc, this.loc );
  return dir;
  }
  
  void collision(Jugador player){
    float dist= track(player).mag(); //Usa la funcion de rastreo y el obtiene la magnitud del vector obtenido, que en este caso representa la distancia (con la formula de Magnitud |V|=Raiz Cuadrada(x2-x1)^2+(y2,y1)^2  Donde x y 'y' son las coordenadas del vector resultado)
    if(dist < this.tam+player.tam){ //(Si la distancia es menor a la suma del tamaño de este enemigo y el tamaño del jugador)
      gano=true;
    }
  }
  
  void display(){
  stroke(0);
  fill(255, 105,100);
  rect(loc.x,loc.y,tam*2,tam*2);
  }
  
  //Función para mostrar la pantalla de Ganador
void ganador(){
    
    background(0);  
    fill(255);
    textSize(72);
    text("USTED HA", 180, 290);
    fill(255,255,0);
    text("GANADO", 200, 400);
}

//Función para mostrar Perdedor
void perdedor(){
  background(0);
    fill(255);
    textSize(56);
    text("USTED HA", 180, 290);
    textSize(80);
    fill(255,10,20);
    text("PERDIDO", 250, 400);
        
}
  
}