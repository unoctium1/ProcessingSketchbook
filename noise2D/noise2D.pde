int d = 1;
float t = 0;
float unit = 0.001;

void setup(){
size(600, 600);
}

void draw(){
float xoff = 0.0;
loadPixels(); 
for (int x = 0; x < width; x++) {
  float yoff = 0.0;
 
  for (int y = 0; y < height; y++) {
    float bright = map(noise(xoff,yoff,t),0,1,0,255);
    pixels[x+y*width] = color(bright);
    yoff += 0.01;
  }
  xoff += 0.01;
}
updatePixels();
t += unit;
}

void mousePressed(){
  noiseDetail(d);
  d++;
  if(unit <= 1){
    unit *= 10;
  }
  else{
    unit = 0.001;
  }
}
