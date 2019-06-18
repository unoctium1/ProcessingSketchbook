float t = 0;
float unit = 0.0001;

float xPrev;
float yPrev;

void setup(){
  size(1000,100);
  background(255);
  fill(0);
  text(unit, 0, 20);
  xPrev = 0;
  yPrev = noise(0) * height;
}
 
void draw() {
  float y = noise(t) * height;
  float x = t*(1/unit); 
  line(x, y, xPrev, yPrev);
  xPrev = x;
  yPrev = y;
  t += unit;
  fill(255);
  noStroke();
  rect(0, 65, 40, 20);
  fill(0);
  stroke(1);
  text(t, 0, 80);
}

void mousePressed(){
  clear();
  background(255);
  unit = unit * 10;
  text(unit, 0, 20);
  t = 0;
  xPrev = 0;
  yPrev = noise(0) * height;
}
