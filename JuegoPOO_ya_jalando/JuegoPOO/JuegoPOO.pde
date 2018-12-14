Jugador player;

Crecedor crece;
Patrulla pat;
Cazador caz;
Meta met;

Boton boton;
ArrayList<Muro> muros; // se declaran
ArrayList<Enemigo> enemigos;

  //la funcion setup se ejecuta una sola vez al inicio del programa, piensa en ella como
  //el "constructor" del main
void setup(){
  //size indica el tamaño de la pantalla, se puede usar width y height  
  //como variables para el ancho y alto de la pantalla 
  size(685,685);
  //borra lo que haya en la pantalla y pinta del color que indique el argumento
  //el color se puede indicar por (Red,Green,Blue, Transparency), (Negro-a-blanco, Transparency), (Negro-a-Blanco)
  //donde cada color puede ser representado por 8 bits, esto es, cada color puede tener un valor de 0 a 2 (donde 0 es el valor minimo y 256 el valor máximo de color)
    background(0);
  //Creamos una instancia de objeto de cada clase.
  enemigos = new ArrayList<Enemigo>();
  muros = new ArrayList<Muro>();//Se definen
  boton = new Boton(width/3,height-100,width/3,50,255,"Reintentar");
  
muros.add(new Muro(new PVector(0,14), 14, 73, color(100,40,150), true));//salida y/o meta 
muros.add(new Muro(new PVector(0,0), 685, 14, color(100,40,150), true));//agrega un nuevo muro
muros.add(new Muro(new PVector(671,0), 14, 685, color(100,40,150), true));//agrega un nuevo muro
muros.add(new Muro(new PVector(0,671), 685, 14, color(100,40,150), true));
muros.add(new Muro(new PVector(0,61), 14, 601, color(100,40,150), true));
muros.add(new Muro(new PVector(0,61), 74, 14, color(100,40,150), true));
muros.add(new Muro(new PVector(0,180), 74, 14, color(100,40,150), true));
muros.add(new Muro(new PVector(0,425), 195, 14, color(100,40,150), true));
muros.add(new Muro(new PVector(0,610), 14, 70, color(100,40,150), true));
muros.add(new Muro(new PVector(0,610), 74, 14, color(100,40,150), true));
muros.add(new Muro(new PVector(60,490), 14, 130, color(100,40,150), true));
muros.add(new Muro(new PVector(62,307), 14, 74, color(100,40,150), true));
muros.add(new Muro(new PVector(123,60), 14, 195, color(100,40,150), true));
muros.add(new Muro(new PVector(123,425), 14, 195, color(100,40,150), true));
muros.add(new Muro(new PVector(63,122), 74, 14, color(100,40,150), true));
muros.add(new Muro(new PVector(63,245), 74, 14, color(100,40,150), true));
muros.add(new Muro(new PVector(63,367), 72, 14, color(100,40,150), true));
muros.add(new Muro(new PVector(63,307), 135, 14, color(100,40,150), true));
muros.add(new Muro(new PVector(123,60), 74, 14, color(100,40,150), true));
muros.add(new Muro(new PVector(183,0), 14, 70, color(100,40,150), true));
muros.add(new Muro(new PVector(184,127), 14, 182, color(100,40,150), true));
muros.add(new Muro(new PVector(182,369), 14, 70, color(100,40,150), true));
muros.add(new Muro(new PVector(183,612), 14, 73, color(100,40,150), true));
muros.add(new Muro(new PVector(124,550), 132, 14, color(100,40,150), true));
muros.add(new Muro(new PVector(184,127), 73, 14, color(100,40,150), true));
muros.add(new Muro(new PVector(182,369), 73, 14, color(100,40,150), true));
muros.add(new Muro(new PVector(185,490), 73, 14, color(100,40,150), true));
muros.add(new Muro(new PVector(244,550), 14, 73, color(100,40,150), true));
muros.add(new Muro(new PVector(243,63), 14, 73, color(100,40,150), true));
muros.add(new Muro(new PVector(241,193), 14, 183, color(100,40,150), true));
muros.add(new Muro(new PVector(244,430), 14, 73, color(100,40,150), true));
muros.add(new Muro(new PVector(244,610), 70, 14, color(100,40,150), true));
muros.add(new Muro(new PVector(243,63), 131, 14, color(100,40,150), true));
muros.add(new Muro(new PVector(241,248), 73, 14, color(100,40,150), true));
muros.add(new Muro(new PVector(244,430), 73, 14, color(100,40,150), true));
muros.add(new Muro(new PVector(300,551), 14, 73, color(100,40,150), true));
muros.add(new Muro(new PVector(304,63), 14, 120, color(100,40,150), true));
muros.add(new Muro(new PVector(303,248), 14, 185  , color(100,40,150), true));
muros.add(new Muro(new PVector(490,0), 14, 73, color(100,40,150), true));
muros.add(new Muro(new PVector(490,60), 125, 14, color(100,40,150), true));
muros.add(new Muro(new PVector(425,63), 14, 73, color(100,40,150), true));
muros.add(new Muro(new PVector(370,123), 305, 14, color(100,40,150), true));
muros.add(new Muro(new PVector(304,183), 316, 14, color(100,40,150), true));
muros.add(new Muro(new PVector(370,183), 14, 320, color(100,40,150), true));
muros.add(new Muro(new PVector(310,490), 74, 14, color(100,40,150), true));
muros.add(new Muro(new PVector(300,550), 140, 14, color(100,40,150), true));
muros.add(new Muro(new PVector(550,490), 125, 14, color(100,40,150), true));
muros.add(new Muro(new PVector(610,490), 14, 135, color(100,40,150), true));
muros.add(new Muro(new PVector(365,612), 14, 73, color(100,40,150), true));
muros.add(new Muro(new PVector(430,250), 14, 372, color(100,40,150), true));
muros.add(new Muro(new PVector(430,250), 73, 14, color(100,40,150), true));
muros.add(new Muro(new PVector(430,610), 73, 14, color(100,40,150), true));
muros.add(new Muro(new PVector(606,189), 14, 75, color(100,40,150), true));
muros.add(new Muro(new PVector(555,250), 65, 14, color(100,40,150), true));
muros.add(new Muro(new PVector(555,250), 14, 73, color(100,40,150), true));
muros.add(new Muro(new PVector(496,313), 73, 14, color(100,40,150), true));
muros.add(new Muro(new PVector(496,313), 14, 73, color(100,40,150), true));
muros.add(new Muro(new PVector(437,377), 73, 14, color(100,40,150), true));
muros.add(new Muro(new PVector(610,315), 14, 130, color(100,40,150), true));
muros.add(new Muro(new PVector(555,377), 64, 14, color(100,40,150), true));
muros.add(new Muro(new PVector(555,377), 14, 73, color(100,40,150), true));
muros.add(new Muro(new PVector(490,436), 73, 14, color(100,40,150), true));
muros.add(new Muro(new PVector(490,436), 14, 120, color(100,40,150), true));
muros.add(new Muro(new PVector(490,550), 73, 14, color(100,40,150), true));
muros.add(new Muro(new PVector(550,550), 14, 125, color(100,40,150), true));
 

   PVector rand = (new PVector(random(0,width), random(0,height)));
   int i=0;
   //jugador
  player = new Jugador(new PVector(random(0,width),random(0,height)));
  
  //enemigos
  while(i!=3){
    rand = (new PVector(random(0,width), random(0,height)));
    if(PVector.sub(rand, player.loc).mag() >100){
      enemigos.add(new Crecedor(rand));
      i++;
    }
    
  }
  i=0;
  while(i!=2){
    rand = (new PVector(random(0,width), random(0,height))); 
    if(PVector.sub(rand, player.loc).mag() >100){
      enemigos.add(new Patrulla(rand));
      i++;
    }
  }
  
  i=0;
  while(i!=1){
    rand = (new PVector(random(0,width), random(0,height)));
    if(PVector.sub(rand, player.loc).mag() >100){
      enemigos.add(new Cazador(rand));
      i++;
    }
  }
  
  //meta

  i=0;
  while(i!=1){
    rand = (new PVector(random(0,width), random(0,height)));
    if(PVector.sub(rand, player.loc).mag() >300){
      met = new Meta(rand,false,false);
      i++;
    }
  }
  
}
  //La funcion draw se ejecuta después del setup, y al terminar de ejecutarse, vuelve al inicio
  //Pero sin cerrar el programa o reiniciar valores, es como un while que regresa informacion entre ciclos
void draw(){
  
  if(met.perdio){
    met.perdedor();  //Si el trigger gameover es true, mostramos pantalla GameOver
    boton.show();
  }else if(met.gano){
    met.ganador(); //Si el trigger gamewinner es true, mostramos la pantalla GameWinner
    boton.show();
  }else{
  
  background(0); //si comentas esto vas a ver para que sirve el background() 
  player.run();
  for(Enemigo e: enemigos){
    e.run(player);
  }
  //crece.run(player);
  //pat.run(player);
  //caz.run(player);
  for(Muro m : muros){
    m.run(player); //se ejecutan con la funcion run, que declaré en la clase muro
  }  
  met.run(player);
}
  
}

//keyPressed es una funcion en las librerías de Processing que detecta cuando una tecla
//fue presionada. Para ver las demás funciones y un ejemplo picale en la barra de menús,
//en Ayuda>Referencia

void keyPressed(){
  if (key == CODED){ //key y keyCode son variables/palabras reservadas para ver cual tecla se presionó, si es CODED es una tecla especial como Alt, ctrl, etc
    if (keyCode == UP){ //checa el keyCode de la tecla
    player.applyforce(new PVector(0,-1));
    }
    else if (keyCode == DOWN){
    player.applyforce(new PVector(0,1));
    }
    
    else if (keyCode == LEFT){
    player.applyforce(new PVector(-1,0));
    }
    else if (keyCode == RIGHT){
    player.applyforce(new PVector(1,0));
    ;
    }
    else{//si no fue ninguna otra tecla, no hace nada
    }
  
  }  
}