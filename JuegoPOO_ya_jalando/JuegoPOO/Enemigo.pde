public class Enemigo{
  PVector loc;
  int vida;
  float tam;
  boolean pelea;
  
  Enemigo(PVector loc){
  this.loc = loc;
  vida = 10;
  tam = 15;
  }
  
  //AGRUPA el chequeo de collision y la funcion de mostrarse en pantalla
  void run(Jugador player){ //agrupamos nuestras funciones en esta para facilitar la lectura y que no se haga confusa la ejecucion en el main
    collision(player);
    display();  
  }
  
  //Funcion de rastreo del jugador por separado, recibe como argumento a un jugador
  PVector track(Jugador player){
  PVector dir= PVector.sub(player.loc, this.loc ); //Con la formula de la diferencia de dos puntos, resta los dos vectores, el del enemigo y el del jugador
  //Lo que le da un vector resultado, con la dirección y la magnitud de esta diferencia
  return dir; //Retorna dicho vector resultado
  }
  
  //Funcion que realiza el rastreo y checa si se traslapan la instancia y el jugador, recibe como argumento a un jugador
  void collision(Jugador player){
    float dist= track(player).mag(); //Usa la funcion de rastreo y el obtiene la magnitud del vector obtenido, que en este caso representa la distancia (con la formula de Magnitud |V|=Raiz Cuadrada(x2-x1)^2+(y2,y1)^2  Donde x y 'y' son las coordenadas del vector resultado)
    if(dist < this.tam+player.tam){ //(Si la distancia es menor a la suma del tamaño de este enemigo y el tamaño del jugador)
      player.golpeado(); //El jugador es golpeado
    }
  }
 
  
  //Se supone que este es para las mecánicas pero sigo pensando como resolver eso
  int pelear(){
  
    return 0;
  }
  
   //mostrar  
  void display(){ //Hacemos una funcion void para dibujar nuestra figura
    noStroke();
    fill(125);
    ellipse(loc.x,loc.y, tam*2,tam*2);
    
  }
  
}