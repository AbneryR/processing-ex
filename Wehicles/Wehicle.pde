class Wehicle{  
  float x,y;
  float w,h;
  Box chassis;
  Tire tire1;
  Tire tire2;
  
  RevoluteJoint joint;
  RevoluteJoint joint1;
  
  
  Wehicle(float x_, float y_){
    
    chassis= new Box(x_,y_, 100,50);
    tire1= new Tire(x_-30,y_+30,10);
    tire2= new Tire(x_+30,y_+30,10);
    
    RevoluteJointDef rjd = new RevoluteJointDef();
    rjd.initialize(chassis.body, tire1.body, tire1.body.getWorldCenter());
    rjd.enableMotor = true;
    rjd.motorSpeed = PI*2;
    rjd.maxMotorTorque=1000.0;
    joint = (RevoluteJoint) box2d.world.createJoint(rjd);
    
    rjd.initialize(chassis.body, tire2.body, tire2.body.getWorldCenter());
    rjd.enableMotor = true;
    rjd.motorSpeed = PI*2;
    rjd.maxMotorTorque=10000.0;
    joint1 = (RevoluteJoint) box2d.world.createJoint(rjd);
    
    
  }
  
  void display(){
    chassis.display();
    tire1.display();
    tire2.display();
  }


}