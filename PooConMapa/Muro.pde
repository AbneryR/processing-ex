public class Muro{
PVector loc;   //vector de posicion
float sizeX;   //float para guardar el ancho
float sizeY;   //float para guardar el alto
color fil;      //variable de processing para almacenar datos sobre color
boolean bad;    //booleano irrelevante

  Muro(PVector loc, float sx, float sy, color fl, boolean bd){
     this.loc = loc; 
     sizeX = sx;
     sizeY = sy;
     fil = fl;
     bad = bd;
     
    } 
    
    void run(){ //con el run agrupo funciones para no estar poniendo en el main 
    /*
    m.display();
    m.chocar();
    m.actualizarposicion();
    m.blablabla()
    
    en lugar de eso, pongo el run
    m.run() , porque aqui en la clase ya lo agrupé
    */
    display();

    }
    

    void display(){ //hago una funcion a la que llamo display, el nombre no importa
    /*
    podría llamarse mostrar, dibujar, pintar, etc. Pero se siente más pro
    incluso podrías poner las instrucciones en el run y deshacerte de estas, así
    void run(){
      noStroke();
       fill(fil);
       rect(loc.x, loc.y, sizeX, sizeY);
    }
    
    Pero si hay funciones con calculos o así, conviene tener las instrucciones agrupadas
    */
     noStroke();
     fill(fil);
     rect(loc.x, loc.y, sizeX, sizeY);
    }

   
}
  
  
  
  
  