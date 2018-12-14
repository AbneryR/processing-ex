Waves [] waves = new Waves [10];

void setup(){

size(800,600);
background(255);
for(int i=0; i<10;i++) waves[i] = new Waves(random(width), random(height));


}

void draw(){
for(int i=0; i<10;i++){
waves[i].update();
waves[i].display();
}

}