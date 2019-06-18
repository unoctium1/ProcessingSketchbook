PVector loc;
PVector velocity;
PVector acceleration;
float radius = 50;

void setup(){
  size(300, 300, P3D);
  loc = new PVector(width/2,height/2, -100);
  velocity = new PVector(5, 3, 3);
  //acceleration = new PVector(0, -4.8);
  
}

void draw(){
  background(255);
  
  loc.add(velocity);
  //velocity.add(acceleration);
  if(loc.x + radius > width || loc.x - radius < 0){
    velocity.x = velocity.x * -1;
  }
  if(loc.y + radius > height || loc.y - radius < 0){
    velocity.y = velocity.y * -1;
  }
  if(loc.z + radius > 0 || loc.z - radius < -1000){
    velocity.z = velocity.z * -1;
  }
  
  pushMatrix();
  translate(loc.x, loc.y, loc.z);
  lights();
  fill(175);
  sphere(radius);
  popMatrix();
  
  translate(width/2,height/2,0);
  noFill();
  box(width, height, 1000);
}
