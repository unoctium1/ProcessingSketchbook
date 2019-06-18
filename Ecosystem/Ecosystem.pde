Mover i;

void setup(){
  size(1000,800);
  i = new Snake();
}

void draw(){
  background(255);
  i.update();
  i.checkbounds();
  i.display();
}
