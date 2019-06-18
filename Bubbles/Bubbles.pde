Bubble[] bubbles = new Bubble[400];
Bubble[] front = new Bubble[50];

color backC = color(125, 240, 240);
color frontC = color(240, 75, 240);

void setup(){
  size(800, 800);
  
  for (int i = 0; i < bubbles.length; i++){
    color background = color(random(0,255),random(225,255),random(225,255));
    bubbles[i] = new Bubble(5, 250, background, 0.3);
  }
  for (int i = 0; i < front.length; i++){
    color mouse = color(random(225,255),random(0,150),random(225,255));
    front[i] = new MouseBubble(5, 40, mouse, 1, 10, 10);
  }
}

void draw(){
  background(255);
  for (int i = 0; i < bubbles.length; i++){
    bubbles[i].update();
    bubbles[i].show();
  }
  for (int i = 0; i < front.length; i++){
    front[i].update();
    front[i].show();
  }
}
