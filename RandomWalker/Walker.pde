import java.util.Random;

class Walker {
  float mean;
  float sd;
  float x;
  float y;
  Random generator;
  float tx;
  float ty;
  
  Walker(float tx, float ty){
    //this.x = x;
    //this.y = y;
    //this.mean = mean;
    //this.sd = sd;
    generator = new Random();
    this.tx = tx;
    this.ty = ty;
  }
  
  void display(){
   stroke(0);
   point(x,y);
  }
  
  float montecarlo(){
    while (true) {
    float r1 = random(1);
    float probability = r1*r1;
    float r2 = random(1);
    if (r2 < probability) {
      return r1;
    }
  }
  }
  
  void step(){
    /*
    float r = random(1);
    if(r <= 0.5){
       if(mouseX > x){
         x ++; 
       }else{
         x--;  
       }
       if(mouseY > y){
         y++;
       }else{
         y--; 
       }
    }else{
      */
      /*
      float stepsize = montecarlo() * 10;
      float stepx = random(-stepsize, stepsize);
      float stepy = random(-stepsize, stepsize);
      x += stepx;
      y += stepy;
      */
      x = map(noise(tx), 0, 1, 0, width);
      y = map(noise(ty), 0, 1, 0, height);
      tx += 0.01;
      ty += 0.01;
      
      
    //}
    
  }
  
}
