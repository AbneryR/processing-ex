class Attractor{
  //Necesitamos mantener la pista de un cuerpo y un radio
  
  Body body;
  float r;
  
  Attractor(float r_, float x, float y){
    r= r_;
    // Definir un cuerpo
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    //Preparar su posición
    bd.position = box2d.coordPixelsToWorld(x,y);
    body = box2d.world.createBody(bd);
    
    //Hacer la forma del cuerpo un circulo
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    
    body.createFixture(cs,1);
    
   }
   
   //Formula para atraccion gravitacional
   //Estamos computando en coordenadas del "mundo"
   //No necesitamos convertir a pixeles y de vuelta
   
   Vec2 attract(Mover m){
   float G = 100; //Magnitud de la fuerza
   //clone() nos hace una copia
   Vec2 pos = body.getWorldCenter();
   Vec2 moverPos = m.body.getWorldCenter();
   //Vector apuntando de Movedor a atractor
   Vec2 force = pos.sub(moverPos);
   float distance = force.length();
   //Keep force within bounds
   distance = constrain(distance,1,5);
   force.normalize();
   // NOta que la masa del atractor es 0 porque está fijo asi que no podemos usarlo
   float strength = (G * 1 * m.body.m_mass) / (distance * distance); // Calcula la magnitud de la fuerza gravitacional
   force.mulLocal(strength);
   return force;
   }
   
   void display(){
   // Vemos cada cuerpo y obtenemos su posición en pantalla
   Vec2 pos = box2d.getBodyPixelCoord(body);
   // Obtener su angulo de rotación
   float a = body.getAngle();
   pushMatrix();
   translate(pos.x,pos.y);
   rotate(a);
   fill(0);
   stroke(0);
   strokeWeight(1);
   ellipse(0,0,r*2,r*2);
   popMatrix();
   }
   
  
}