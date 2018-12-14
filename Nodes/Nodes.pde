ArrayList<Tree> trees;
ArrayList<Node> nodes;
/*
Hay arboles y raices
Arboles = Solo hace un root, falta agregar la deteccion entre nodo normal y root
nodos = falta agregar la deteccion entre root y root, y el desire de busqueda de roots
falta agregar la bandera de nodoPerteneceARoot, para que no busque más roots (termine su wandering)
falta
*/


void setup(){
size(800,600);
background(0);
trees = new ArrayList<Tree>();
nodes = new ArrayList<Node>();
}


void draw(){
background(255);
for(Tree t:trees){
  t.root.display();
  t.root.update();
}

for(Node nodo:nodes){
  nodo.display();
  nodo.update();
}
}


void mouseClicked(){
  trees.add(new Tree());
}

void keyPressed(){
  nodes.add(new Node(floor(random(0,100))));
}