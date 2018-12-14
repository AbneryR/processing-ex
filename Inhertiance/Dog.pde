class Dog extends Animal{
  color haircolor;//adds custom properties
  
  Dog(){
    super();//runs parent's constructor
    haircolor = color(random(255));//initialize own properties' value
  }
  
  void eat(){//a function can be overriden
    super.eat();//can run the parent´s function, which has been overriden...
    println("Woof! Woof! Slurp.");//AND more specific to the class code can bea added
  }

  void bark(){
    println("WOOF!");
  }
}