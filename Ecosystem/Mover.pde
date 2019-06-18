abstract class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float radius = 8;
  float topspeed = 8;
  
  Mover(float radius, float topspeed, PVector initLoc, PVector initVel, PVector initAcc){
    this.radius = radius;
    this.topspeed = topspeed;
    location = initLoc;
    velocity = initVel;
    acceleration = initAcc;
  }
  
    
  abstract PVector setAcceleration();
  abstract void drawAnimal(PVector loc, float r);
  
  void update(){
   //PVector mouse = new PVector(mouseX, mouseY);
   //PVector dir = PVector.sub(mouse, location);
   //float dist = dir.mag();
   //dir.normalize();
   //dir.mult(5/dist);
   
   acceleration = setAcceleration();
   velocity.add(acceleration);
   velocity.limit(topspeed);
   location.add(velocity); 
   
  }

  
  void display(){
   drawAnimal(location, radius);
  }
  
  void checkbounds(){
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }
 
    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
  }
}
