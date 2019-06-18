class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float radius = 8;
  float topspeed = 8;
  
  Mover(){
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(-2,2), random(-2,2));
    acceleration = new PVector(0,0);
  }
  
  void update(){
   PVector mouse = new PVector(mouseX, mouseY);
   PVector dir = PVector.sub(mouse, location);
   float dist = dir.mag();
   dir.normalize();
   dir.mult(5/dist);
   
   acceleration = dir;
   velocity.add(acceleration);
   velocity.limit(topspeed);
   location.add(velocity); 
   
  }
  
  void display(){
   stroke(0);
   fill(175);
   ellipse(location.x, location.y, radius*2, radius*2);
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
