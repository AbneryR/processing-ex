class Node{
  boolean isRoot;
  int value;
  Node left;
  Node right;
  
  PVector loc;
  PVector vel;
  PVector acc;
  
    Node(int val){
      this.value = val;
      this.left = null;
      this.right = null;
      loc =new PVector(random(height),random(height));
      vel =new PVector(0,0);
      acc =new PVector(random(2),random(2));
    }
    
    void update(){
      vel.add(acc);
      vel.limit(10);
      loc.add(vel);
      acc.mult(0);
    }
    
    void display(){
      if(this.isRoot){
      fill(120,20,120);  
      }
      else{
        fill(130);
      }
      ellipse(this.loc.x,this.loc.y, value,value);
    
    }
    
    
    
    
    
    
}