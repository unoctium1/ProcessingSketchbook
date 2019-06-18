class NervousFly extends Mover{
  
  NervousFly(){
    super(random(5, 10), 
          random(8,10), 
          new PVector(random(0, width), 
          random(0,height)), 
          PVector.random2D().mult(3), 
          new PVector(0,0));
  }
  
  PVector setAcceleration(){
    float jump = random(1);
    PVector acc = PVector.random2D();
    if(jump < 0.1){
      acc.mult(10);
    }
    else{
      acc.mult(0.5);
    }
    
    return acc;
  }
  
  void drawAnimal(PVector loc, float r){
    fill(175);
    noStroke();
    ellipse(loc.x, loc.y, r, r);
  }
  
}
