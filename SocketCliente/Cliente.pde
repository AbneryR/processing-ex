import java.net.Socket;
import java.io.DataInputStream;
import java.io.InputStreamReader;

class Cliente {

  static final String HOST = "localhost";
  static final int Puerto = 5000;
  String str= "none";
  BufferedReader br;
  PrintWriter pw;
  
  PVector loc;
  color col;
  

  public Cliente()
  {
    loc = new PVector(width/2, height/2);
    col = color(random(255), random(255),random(255));
    System.out.println("Cliente iniciado");
  }

  void conectar() {
    try 
    {
      Socket skCliente = new Socket(HOST, Puerto);
      InputStream aux = skCliente.getInputStream();
      //DataInputStream flujo = new DataInputStream(aux);

      //buffer de entrada de datos del server
      br = new BufferedReader(new InputStreamReader(skCliente.getInputStream()));
      //writer para mandar cosas
      pw = new PrintWriter(skCliente.getOutputStream(), true);

      //Enviamos str al server
      pw.println(str);
     
    }
    //System.out.println("El servidor dice"+flujo.readUTF());
    //skCliente.close();


    catch(Exception e)
    {
      System.out.println(e.getMessage());
    }
  }

  void check() {
    try {
      while ((str= br.readLine()) != null) {
        if(str == "change") col = color(random(255),random(255),random(255));
      }
    }

    catch (Exception e) {
    }
  }
  
  void display(){
    fill(col);
    rect(loc.x, loc.y, 60,60);
  }
}