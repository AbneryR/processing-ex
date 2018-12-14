import java.net.Socket;
import java.net.ServerSocket;
import java.io.DataInputStream;
import java.io.InputStreamReader;

class Servidor{
  
  public static final String HOST = "localhost";
  public static final int port = 5000;
  private PrintWriter out;
  private BufferedReader in;
  public Servidor(){
    System.out.println("Servidor iniciado en"+ HOST+"\\"+ port);   
  }
  
   void Escuchar(){
     try{
     ServerSocket svr = new ServerSocket(port); 
      Socket clientSocket = svr.accept();
      System.out.println("Llegó un Cliente");
      out = new PrintWriter(clientSocket.getOutputStream(), true);
      out.println("Cliente conectado");
      in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
      String str;
      //out.close();
      //in.close();

//      clientSocket.close();

      }
     catch (IOException e){
     
     }
     
   }
   
   void button(){
     if (keyPressed){
       if(key == 'a'){
         out.println("change");
         System.out.println("change");
       }
     }
   }

}