class Revoluted{
  RevoluteJoint joint;
  Box box1;
  Box box2;
  
  
  Revoluted(float x_,float y_){
  
  box1 = new Box(x_,y_,120,10,false);
  box2 = new Box(x_,y_,10,40,true);
  
  
  
  RevoluteJointDef rjd = new RevoluteJointDef();
  rjd.initialize(box1.body,box2.body,box1.body.getWorldCenter());
  
  rjd.enableMotor = true;
  rjd.motorSpeed = PI*2;
  rjd.maxMotorTorque = 1000.0;
  joint = (RevoluteJoint) box2d.world.createJoint(rjd);
  }
  
  void toggleMotor(){
    boolean motorstatus = joint.isMotorEnabled();
    joint.enableMotor(!motorstatus);
  }
  
  void display(){
    box1.display();
    box2.display();
  
  }
}