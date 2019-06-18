Walker[] w;
int count = 1;

void setup(){
  size(640, 360);
  w = new Walker[count];
  for(int i = 0; i < count; i++){
    w[i] = new Walker(random(0,10000), random(1,10000));
  }
  background(255);
}

void draw(){
  for(int i = 0; i < count; i++){
    w[i].step();
    w[i].display();
  }
  
  
}
