class Boton{
  
  int posX, posY, sizeX, sizeY;
  color fll;
  String texte;
  
  
  Boton(){
    
      posX = 0;
      posY = 0;
      sizeX = 0;
      sizeY = 0;
      fll = color(0);
      texte = ""; 
    
  }
  
    Boton(int px, int py, int sx, int sy, color fl, String tx){
      posX = px;
      posY = py;
      sizeX = sx;
      sizeY = sy;
      fll = color(fl);
      texte = tx; 
    }
    
    // Función para mostrar boton
    void show(){
      
     fill(fll);
     rect(posX, posY, sizeX, sizeY, 3);
     fill(0);
     textSize(20);
     text(texte,posX-10+sizeX/3,posY+30);
     this.clicker(); 
      
    }
 
   // Función para detectar el Click
   void clicker(){
  
     if(mousePressed){
      
        if(mouseX > posX && mouseX < posX+sizeX && mouseY > posY && mouseY < posY+sizeY){
           //Si se clicla, ponemos los boleanos en falso y empieza la partida de nuevo 
           met.gano = false;
           met.perdio = false;
           setup();
        }
        
     }
       
   }
}  