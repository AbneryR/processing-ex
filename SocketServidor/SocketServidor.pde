Servidor svr;

void setup(){
  svr = new Servidor();
  
  
}

void draw(){
  svr.Escuchar();
  svr.button();
}