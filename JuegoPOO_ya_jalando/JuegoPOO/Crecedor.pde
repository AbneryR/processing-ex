public class Crecedor extends Enemigo{
int tiempo;
boolean flag;
  Crecedor(PVector loc){
  super(loc);
  tiempo = millis();
  flag = true;
  }
  
  void run(Jugador player){
    if(flag==true)
    crecer();
    else
    contraer();
    super.run(player);
    
    
  }
  
  void crecer(){
    tiempo=second();
    if(tiempo!=tiempo-1){tam++;}
    if(tam>50) flag = false;
  }
  
  void contraer(){
    tiempo=second();
    if(tiempo!=tiempo-1){tam--;}
    if(tam<9)flag=true;
  }
  
  void display(){
    noStroke();
    fill(160,10,120);
    ellipse(loc.x,loc.y, tam*2,tam*2);
  }
}