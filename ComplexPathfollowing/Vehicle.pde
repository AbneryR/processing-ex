class Vehicle{
  PVector target = null;
  PVector acc;
  PVector vel;
  PVector loc;
  float r;
  float maxspeed;
  float maxforce;

  
 Vehicle(float x, float y) { 
   acc = PVector.random2D();
   vel = new PVector(0,0);
   loc = new PVector(x,y); 
   r = 3.0;
   maxspeed = 4;
   maxforce = 0.1;
   
}

   void run(){
     update();
     display();
     edges();
   }

    
    void update(){
    vel.add(acc);
    vel.limit(25);
    loc.add(vel);
    acc.mult(0);
    }
    
    void seek(PVector target){
       PVector desired = PVector.sub(target, loc);
       if(desired.mag() == 0) return;
       
       desired.normalize();
       desired.mult(maxspeed);
       PVector steer = PVector.sub(desired, vel);
       steer.limit(maxforce);
       applyForce(steer);
    }
    
    void applyForce(PVector force){
      PVector f = force.get();
      acc.add(f);
    }
    
    void follow(Path p){
      PVector predict = vel.get(); //Obtener velocidad
      predict.normalize(); // Normalizar para obtener direccion
      predict.mult(25); // Direccion + mas adelantito
      PVector predictLoc = PVector.add(loc, predict); // ubicamos al vehiculo y agregamos la prediccion (direccion + mas adedlantito
      PVector normal = null;
      PVector target = null;
      float worldRecord = 1000000;
      for(int i = 0; i<p.points.size()-1; i++){
        PVector a = p.points.get(i); //(vector a = inicio del camino)
        PVector b = p.points.get(i+1);  // (vector b = fin del camino)
        PVector normalPoint = getNormalPoint(predictLoc, a, b);
       
       if(normalPoint.x < min(a.x , b.x ) || normalPoint.x > max( b.x, a.x )){
         normalPoint = b.get();
         }
         
        float distance = PVector.dist(predictLoc, normalPoint);
        
        if(distance < worldRecord){
          worldRecord = distance;
          normal = normalPoint.get();
        
       
        PVector dir = PVector.sub(b,a);
        dir.normalize(); // Obtener la direccion a la que apunta el camino
        dir.mult(10); // Apuntar más adelantito
        target = PVector.add(normalPoint, dir); //
             

       }
      }
        if(worldRecord> p.radius){
          seek(target);  
        }
        
    }
    
    
    
    PVector getNormalPoint(PVector p, PVector a, PVector b){
      PVector ap = PVector.sub(p,a); // Obtener vector PA, prediccion-InicioDelCamino
      PVector ab = PVector.sub(b,a); // Obtener vector AB, inicio del camino, fin del camino
      
      ab.normalize(); //Obtenemos la direccion
      ab.mult(ap.dot(ab)); //Con el producto punto A . B, obtenemos la proyeccion escalar (sombra) del punto que queremos predecir, en la linea
      //Esto es, obtener la distancia a la que está la linea perpendicular entre el objeto predecido del camino,
      PVector normalPoint = PVector.add(a, ab);
      
      return normalPoint;
    }
    
    
    
    
    void edges(){
      if(loc.x < 0 ){ loc.x= width; }
      if(loc.x >width){loc.x = 0;}
      if(loc.y < 0 ){  loc.y = height;}
      if(loc.y > height ){  loc.y = 0;}
    }
    
      void display() {
    // Draw a triangle rotated in the direction of velocity
    float theta = vel.heading2D() + radians(90);
    fill(175);
    stroke(0);
    pushMatrix();
    translate(loc.x,loc.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();
    popMatrix();
  }


}