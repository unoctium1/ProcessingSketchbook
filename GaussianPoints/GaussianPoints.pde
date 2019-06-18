import java.util.Random;

Random generator;

float sd = 25;
int c = color(200, 200, 125);
int c_sd = color(15, 15, 15);

void setup(){
  size(640, 360);
  background(255);
  generator = new Random();
  noStroke();
}

void draw(){
  fill(gaussianColor(c, sd));
  float x = (float)generator.nextGaussian() * sd + mouseX;
  float y = (float)generator.nextGaussian() * sd + mouseY;
  ellipse(x, y, 5, 5);
}

int gaussianColor(int meanColor, float sd){
  int red = (int)((float) generator.nextGaussian() * sd + red(meanColor));
  int green = (int)((float) generator.nextGaussian() * sd + green(meanColor));
  int blue = (int)((float) generator.nextGaussian() * sd + blue(meanColor));
  return color(red, green, blue);
}
