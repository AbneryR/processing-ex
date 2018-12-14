class Ambiente{
 PVector loc;
 float w;
 float h;
 float maxspeed;
 float maxforce;
 color fil;
 
 Ambiente(PVector loc, float w, float h, float maxspeed, float maxforce){
   this.loc = loc;
   this.w = w;
   this.h = h;
   this.maxspeed= maxspeed;
   this.maxforce= maxforce;
   fil= color(map(maxspeed,-2,2,0,255), 40,map(maxforce,-2,2,0,255), 40);
 }
 
 void display(){
   fill(fil);
   noStroke();
   rect(loc.x,loc.y,w,h);
 }
 

}