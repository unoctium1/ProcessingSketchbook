int pix = 15;
boolean decrease = false;

int isStaticNoise = 0;

int lowerBound;
int higherBound;

int refreshRate;
int counter;
float t;

boolean isPaused = false;

enum RectType {normal, boxxy, noisy, shaky, random};

RectType r = RectType.normal;

void setup(){
  size(800,800);
  reset();
  counter = 0;
  t =0;
  //randomSeed(99);
}

void keyPressed() {
  if (key == ' ') {
    if(isStaticNoise == 3){
      isStaticNoise = 0;
    }else{
      isStaticNoise ++;
    }
  }
  if(key == 'p'){
    if(isPaused){
       loop();
    }else{
      noLoop();
    }
    isPaused = !isPaused;
  }
  if(key == 'b') r = RectType.boxxy;
  if(key == 'n') r = RectType.normal;
  if(key == 'm') r = RectType.noisy;
  if(key == 'v') r = RectType.shaky;
  if(key == 'c') r = RectType.random;
}

void reset(){
  counter = 0;
  refreshRate = (int)random(3,25);
  lowerBound = (int)random(0,100);
  higherBound = (int)random(100,10000);
  //pix = 2;
}

void draw(){
  if(isStaticNoise < 2){
    counter++;
    if(counter == refreshRate) reset();
  }
  handleMouse();
  background(255);
  noStroke();
  //float xoff = 0.0;
  for(int i =0; i < width; i+=pix){
    //float yoff = 0.0;
    for(int j =0; j < height; j+=pix){
      fill(randomColor(i, j, t));
      chooseRect(i, j);
      //yoff += 0.01;
    }
    //xoff += 0.01;
  }
  t += 0.01;
}

void chooseRect(int x, int y){
  switch(r){
        case normal:
          rect(x, y, pix, pix);
          break;
        case boxxy:
          boxxyyyyyyy(x, y);
          break;
        case noisy:
          noisyRect(x, y);
          break;
        case shaky:
          shakyRect(x, y);
          break;
        case random:
          randomRect(x, y);
          break;
      }
}

void noisyRect(int x, int y){
  rect(x, y, random(1, width-x), random(1, height-y));
}

void randomRect(int x, int y){
  if(noise(x, y) > 0.4){
    noisyRect(x,y);
  }
}

void boxxyyyyyyy(int x, int y){
  rect(x, y, random(1, pix+15), random(1, pix+15));
}

void shakyRect(int x, int y){
  rect(x, y, random(pix-5, pix+15), random(pix-5, pix+15));
}

void handleMouse(){
  if(pix > 100) decrease = true;
  if(pix < 3) decrease = false;
  
  if(mousePressed){
    if(!decrease){
      pix++;
    }else{
      pix--;
    }
  }
}

color randomColor(float x, float y, float t){
  if(isStaticNoise < 2){
    randomSeed((long)random(lowerBound,higherBound)); //this is pretty fun
  }
  if (isStaticNoise == 0 || isStaticNoise == 3){
    float r = noise(x) * 255;
    float g = noise(x, y) * 255;
    float b = noise(x, y, t) * 255;     
    //return color(random(r), random(g), random(b));
    return color(random(b), random(b), random(b));
    //return (int)(noise(x,y,t)*255);
  } else{
    return color(random(255), random(255),random(255));
  }
  
  
}
