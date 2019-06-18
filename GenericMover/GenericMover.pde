Mover[] m = new Mover[10];

void setup(){
  size(500,400);
  for(int i =0; i < 10; i++){
    m[i] = new Mover();
  }
}

void draw(){
  background(255);
  for (int i = 0; i < 10; i++){
    m[i].update();
    m[i].checkbounds();
    m[i].display();
  }
}
