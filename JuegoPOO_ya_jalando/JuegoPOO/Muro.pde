public class Muro{
PVector loc;  
float sizeX;
float sizeY;
color fil;
boolean bad;

  Muro(PVector loc, float sx, float sy, color fl, boolean bd){
     this.loc = loc;
     sizeX = sx;
     sizeY = sy;
     fil = fl;
     bad = bd;
     
    } 
    
    void run(Jugador player){
    display();
    collision(player);
    }
    
    // Función para mostrar las paredes
    void display(){
     noStroke();
     fill(fil);
     rect(loc.x, loc.y, sizeX, sizeY);
    }

    void collision(Jugador player){
     
      
        //Sensores internos
        //superior
        if( (player.loc.x+3) > this.loc.x && (player.loc.x+3) < this.loc.x+sizeX && (player.loc.y+3) > this.loc.y && (player.loc.y+3) < this.loc.y+4){
          player.vel.y*=-1; player.loc.y -=3; println("sup");
        }
        //inferior
        if( (player.loc.x+3) > this.loc.x && (player.loc.x+3) < this.loc.x+sizeX && (player.loc.y-3) > this.loc.y+sizeY-4 && (player.loc.y-3) < this.loc.y+sizeY){
          player.vel.y*=-1; player.loc.y +=3; println("inf");
        }
        
        //izq
        if( (player.loc.x+3) > this.loc.x && (player.loc.x-3) < this.loc.x+4 && (player.loc.y-3) > this.loc.y && (player.loc.y-3) < this.loc.y+sizeY){
          player.vel.x*=-1; player.loc.x -=3; println("izq");
        }
        //der
        if( (player.loc.x-3) > this.loc.x+sizeX-4 && (player.loc.x-3) < this.loc.x+sizeX && (player.loc.y+3) > this.loc.y && (player.loc.y+3) < this.loc.y+sizeY){
          player.vel.x*=-1; player.loc.x +=3; println("der");
        }
        
        
        /*
        
        
        if(
         (player.loc.x+10) > this.loc.x && (player.loc.x+10) < this.loc.x+sizeX && (player.loc.y+10) > this.loc.y && (player.loc.y+10) < this.loc.y+sizeY  ||
         (player.loc.x+10) > this.loc.x && (player.loc.x+10) < this.loc.x+sizeX && (player.loc.y-10) > this.loc.y && (player.loc.y-10) < this.loc.y+sizeY  ||
         (player.loc.x-10) > this.loc.x && (player.loc.x-10) < this.loc.x+sizeX && (player.loc.y-10) > this.loc.y && (player.loc.y-10) < this.loc.y+sizeY  ||
         (player.loc.x-10) > this.loc.x && (player.loc.x-10) < this.loc.x+sizeX && (player.loc.y+10) > this.loc.y && (player.loc.y+10) < this.loc.y+sizeY  

      ){
        //Sensores internos
        //superior
        if( (player.loc.x10) > this.loc.x && (player.loc.x+10) < this.loc.x+sizeX && (player.loc.y+10) > this.loc.y && (player.loc.y+10) < this.loc.y+3){
          player.vel.y*=-1;
        }
        //inferior
        if( (player.loc.x+10) > this.loc.x && (player.loc.x+10) < this.loc.x+sizeX && (player.loc.y+10) > this.loc.y+sizeY-3 && (player.loc.y+10) < this.loc.y+sizeY){
          player.vel.y*=-1;
        }
        
        //izq
        if( (player.loc.x+10) > this.loc.x && (player.loc.x+10) < this.loc.x+3 && (player.loc.y+10) > this.loc.y && (player.loc.y+10) < this.loc.y+sizeY){
          player.vel.x*=-1;
        }
        //der
        if( (player.loc.x+10) > this.loc.x+sizeX-3 && (player.loc.x+10) < this.loc.x+sizeX && (player.loc.y+10) > this.loc.y && (player.loc.y+10) < this.loc.y+sizeY){
          player.vel.x*=-1;
        }

        
        //ESTOS IFFFFFS
        if(player.vel.x >0 && player.vel.y == 0 ){player.vel.x *=-1;}
        
        else if(player.vel.x <0 && player.vel.y == 0 ){player.vel.x *=-1;}
       
        else if(player.vel.y >0 && player.vel.x <=0){player.vel.x*=-1;} //abajo a izq
        
        else if(player.vel.x >0 && player.vel.y <=0){ //yendo de hacia la derecha y hacia arriba
        player.vel.y *=-1 ; println("DerechaArriba");}
        
        else if(player.vel.x < 0 && player.vel.y <=0){ //yendo hacia la izquierda, hacia arriba
        player.vel.y *= -1; println("IzquierdaArriba");}
        
        else if(player.vel.x >=0 && player.vel.y >=0){ //yendo hacia la derecha y hacia abajo
        player.vel.y *=-1 ; println("DerechaAbajo"); }
        
        else if(player.vel.x < 0 && player.vel.y >=0){ //yendo hacia la izquieda y hacia abajo
        player.vel.y *= -1; println("IzquierdaAbajo");}
        
        /*
        else if(player.vel.y >=0 && player.vel.x <=0){ // yendo hacia abajo y hacia la izquierda
        player.vel.y *=-1 ; println("porDerechaArriba");}
       
        else if(player.vel.y <0  && player.vel.x <=0){ // yendo hacia  arriba y hacia la izquieda
        player.vel.y *= -1; }
        
        else if(player.vel.y >=0 && player.vel.x >=0){ // yendo hacia abajo y a la derecha
        player.vel.x *=-1 ; }
        
        else if(player.vel.y <0  && player.vel.x >=0){ // yendo hacia arriba y a la derecha
        player.vel.x *= -1; }
        */
        
        
        println("Contacto");
        //En el caso de haber pisado una pared...
        
        /*if(!bad){
        gameOver = true; //Si la pared era mala (Negra, bad = true) Game over
        }else{
            //En el caso contrario, bad = false...
            if(tiempo.getTime() >= 30){
            gameWinner = true; //Si quedaban mas de 30 segundos, GameWinner.
            }else{
            gameOver = true; //Del caso contrario, GameOver.
            }
            
        }¨*/
      
      
    }
  
  
  
  
  
}