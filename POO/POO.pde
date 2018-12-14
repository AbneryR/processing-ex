
ArrayList<Enemigos> enemies;

Jugador player;
EnemigoSecuencia es;
EnemigoMemoria em;
EnemigoOperaciones eo;
EnemigoReflejos er;

void setup(){
size(800,600);
background(255);
player = new Jugador(new PVector(width/2,height/2));
/* //Prueba de objetos enemigos individuales 
es = new EnemigoSecuencia(new PVector(width/2+100,height/2+100));
em = new EnemigoMemoria(new PVector(width/2-100,height/2-100));
eo = new EnemigoOperaciones(new PVector(width/2-100,height/2+100));
er = new EnemigoReflejos(new PVector(width/2+100,height/2-100));
*/
//Prueba de Herencia en ArrayList
enemies = new ArrayList<Enemigos>();
enemies.add(new EnemigoSecuencia(new PVector(width/2+100,height/2+100)));
enemies.add(new EnemigoMemoria(new PVector(width/2-100,height/2-100)));
enemies.add(new EnemigoOperaciones(new PVector(width/2-100,height/2+100)));
enemies.add(new EnemigoReflejos(new PVector(width/2+100,height/2-100)));
}

void draw(){
  background(255);
  player.run();
  /* //Prueba de objetos enemigos individuales
  es.run(player);
  em.run(player);
  eo.run(player);
  er.run(player);
  */
  //Prueba de for each con arraylist()
  for(Enemigos e: enemies){
    e.run(player);
  }
  text("vida: "+player.vida, 10,10);
}



void keyPressed(){
  if (key==CODED){
      if(keyCode == RIGHT){
        //player.loc.x+=40;
        player.applyforce(new PVector(1,0));
      }
      else if(keyCode == LEFT){
        //player.loc.x-=40;
        player.applyforce(new PVector(-1,0));
      }
      else if(keyCode == UP){
        //player.loc.y-=40;
        player.applyforce(new PVector(0,-1));
      }
      else if(keyCode == DOWN){
        //player.loc.y+=40;
        player.applyforce(new PVector(0,1));
      }
      else{
        
      }
  }
  
}