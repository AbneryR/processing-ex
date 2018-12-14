import java.net.Socket;
import java.io.DataInputStream;
import java.io.InputStreamReader;

class ClienteTemp {

  static final String HOST = "localhost";
  static final int Puerto = 5000;

  public ClienteTemp()
  {

    System.out.println("Cliente iniciado");
  }

  void conectar() {
    try 
    {
      Socket skCliente = new Socket(HOST, Puerto);
      InputStream aux = skCliente.getInputStream();
      //DataInputStream flujo = new DataInputStream(aux);

      //buffer de entrada de datos del server
      BufferedReader br = new BufferedReader(new InputStreamReader(skCliente.getInputStream()));
      //writer para mandar cosas
      PrintWriter pw = new PrintWriter(skCliente.getOutputStream(), true);
      String str= "none";
      //Enviamos str al server
      pw.println(str);
      //Leemos lo que nos responda
      while ((str = br.readLine()) != null) {//Mientras nos esté respondiendo algo
        System.out.println(str); //Imprimir que respondió
        pw.println("bye"); //Enviarle un bye

        if (str.equals("bye")) //Si también responde con bye, salir
          break;
      }

      br.close();
      pw.close();
      skCliente.close();
    }



    //System.out.println("El servidor dice"+flujo.readUTF());
    //skCliente.close();
  

  catch(Exception e)
  {
    System.out.println(e.getMessage());
  }
}
}