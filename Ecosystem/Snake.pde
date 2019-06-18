class Snake extends Mover{
  PVector direction;
  int pastUnits = 100;
  PVector[] pastLoc;
  int index = 0; 
  int ticks = 0;
  int dir = 1;
  
  Snake(){
    super(random(5, 10), 
          random(8,10), 
          new PVector(random(0, width), 
          random(0,height)), 
          PVector.random2D().mult(3), 
          new PVector(0,0));
    pastLoc = new PVector[10];
    for(int i = 0; i < pastUnits; i++){
      pastLoc[i] = new PVector(location.x, location.y);
    }
    direction = velocity;
  }
  
  PVector setAcceleration(){
    ticks ++;
    if(ticks >= 5){
      dir *= -1;
      ticks = 0;
    }
    PVector acc = direction.normalize();
    acc.rotate(HALF_PI);
    acc.mult(dir * 2);
    return acc;
  }
  
  void drawAnimal(PVector loc, float r){
    pastLoc[index] = loc;
    index ++;
    if(index >= pastUnits) index = 0;
    fill(175);
    noStroke();
    for(int i =0; i < pastUnits; i++){
      ellipse(pastLoc[i].x, pastLoc[i].y, r, r);
    }
  }
  
}
