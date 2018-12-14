ArrayList<Muro> muros; // se declara un arrayList

void setup(){
size(685,685); //se configura el tamaño de la ventana a 800 x 600 pixeles
background(255); // hacemos blanco el fondo puedes jugar a ponerlo de otros colores bacground(rojoDe0A255, verdeDe0a255, azulDe0a255);
muros = new ArrayList<Muro>(); //
//con muros.add() agregas un nuevo elemento al arraylist
//Notarás el parecido que tiene el new Muro(bla bla bla) con el constructor de la clase muro, es porque son los valores que le 
//vas a asignar y así
                               //x //y //ancho//alto //color     //noimporta
muros.add(new Muro(new PVector(0,0), 685, 14, color(0), true));//agrega un nuevo muro
muros.add(new Muro(new PVector(671,0), 14, 685, color(0), true));//agrega un nuevo muro
muros.add(new Muro(new PVector(0,671), 685, 14, color(0), true));
muros.add(new Muro(new PVector(0,61), 14, 501, color(0), true));
muros.add(new Muro(new PVector(0,61), 74, 14, color(0), true));
muros.add(new Muro(new PVector(0,180), 74, 14, color(0), true));
muros.add(new Muro(new PVector(0,425), 195, 14, color(0), true));
muros.add(new Muro(new PVector(0,610), 14, 70, color(0), true));
muros.add(new Muro(new PVector(0,610), 74, 14, color(0), true));
muros.add(new Muro(new PVector(60,490), 14, 130, color(0), true));
muros.add(new Muro(new PVector(62,307), 14, 74, color(0), true));
muros.add(new Muro(new PVector(123,60), 14, 195, color(0), true));
muros.add(new Muro(new PVector(123,425), 14, 195, color(0), true));
muros.add(new Muro(new PVector(63,122), 74, 14, color(0), true));
muros.add(new Muro(new PVector(63,245), 74, 14, color(0), true));
muros.add(new Muro(new PVector(63,367), 72, 14, color(0), true));
muros.add(new Muro(new PVector(63,307), 135, 14, color(0), true));
muros.add(new Muro(new PVector(123,60), 74, 14, color(0), true));
muros.add(new Muro(new PVector(183,0), 14, 70, color(0), true));
muros.add(new Muro(new PVector(184,127), 14, 182, color(0), true));
muros.add(new Muro(new PVector(182,369), 14, 70, color(0), true));
muros.add(new Muro(new PVector(183,612), 14, 73, color(0), true));
muros.add(new Muro(new PVector(124,550), 132, 14, color(0), true));
muros.add(new Muro(new PVector(184,127), 73, 14, color(0), true));
muros.add(new Muro(new PVector(182,369), 73, 14, color(0), true));
muros.add(new Muro(new PVector(185,490), 73, 14, color(0), true));
muros.add(new Muro(new PVector(244,550), 14, 73, color(0), true));
muros.add(new Muro(new PVector(243,63), 14, 73, color(0), true));
muros.add(new Muro(new PVector(241,193), 14, 183, color(0), true));
muros.add(new Muro(new PVector(244,430), 14, 73, color(0), true));
muros.add(new Muro(new PVector(244,610), 70, 14, color(0), true));
muros.add(new Muro(new PVector(243,63), 131, 14, color(0), true));
muros.add(new Muro(new PVector(241,248), 73, 14, color(0), true));
muros.add(new Muro(new PVector(244,430), 73, 14, color(0), true));
muros.add(new Muro(new PVector(300,551), 14, 73, color(0), true));
muros.add(new Muro(new PVector(304,63), 14, 120, color(0), true));
muros.add(new Muro(new PVector(303,248), 14, 185  , color(0), true));
muros.add(new Muro(new PVector(490,0), 14, 73, color(0), true));
muros.add(new Muro(new PVector(490,60), 125, 14, color(0), true));
muros.add(new Muro(new PVector(425,63), 14, 73, color(0), true));
muros.add(new Muro(new PVector(370,123), 305, 14, color(0), true));
muros.add(new Muro(new PVector(304,183), 316, 14, color(0), true));
muros.add(new Muro(new PVector(370,183), 14, 320, color(0), true));
muros.add(new Muro(new PVector(310,490), 74, 14, color(0), true));
muros.add(new Muro(new PVector(300,550), 140, 14, color(0), true));
muros.add(new Muro(new PVector(550,490), 125, 14, color(0), true));
muros.add(new Muro(new PVector(610,490), 14, 135, color(0), true));
muros.add(new Muro(new PVector(365,612), 14, 73, color(0), true));
muros.add(new Muro(new PVector(430,250), 14, 372, color(0), true));
muros.add(new Muro(new PVector(430,250), 73, 14, color(0), true));
muros.add(new Muro(new PVector(430,610), 73, 14, color(0), true));
muros.add(new Muro(new PVector(606,189), 14, 75, color(0), true));
muros.add(new Muro(new PVector(555,250), 65, 14, color(0), true));
muros.add(new Muro(new PVector(555,250), 14, 73, color(0), true));
muros.add(new Muro(new PVector(496,313), 73, 14, color(0), true));
muros.add(new Muro(new PVector(496,313), 14, 73, color(0), true));
muros.add(new Muro(new PVector(437,377), 73, 14, color(0), true));
muros.add(new Muro(new PVector(610,315), 14, 130, color(0), true));
muros.add(new Muro(new PVector(555,377), 64, 14, color(0), true));
muros.add(new Muro(new PVector(555,377), 14, 73, color(0), true));
muros.add(new Muro(new PVector(490,436), 73, 14, color(0), true));
muros.add(new Muro(new PVector(490,436), 14, 120, color(0), true));
muros.add(new Muro(new PVector(490,550), 73, 14, color(0), true));
muros.add(new Muro(new PVector(550,550), 14, 125, color(0), true));



//añade mas muros.add y arma el laberinto <---ESTO ES LO QUE HAY QUE MOVERLE AHORITA

}
//Variable enemigo
float puntoX; //variable para el punto
float puntoY;


void draw(){
  background(255);
  for(Muro m: muros){ //este es un ciclo For Each, en el que hacemos un muro m, que es como un apuntador
  //que recorrerá los elementos del ArrayList muros
  m.run(); //es como si hicieramos un for y aqui pusieramos muros[i].run()
  
  //ENEMIGO
  puntoX=random(width);
  puntoY=random(height);
  
  // Creamos el punto
  fill(255);
  ellipse(puntoX,puntoY,24,24);
  //Movimiento del punto
  //puntoX=random(10,150);
  }

}
