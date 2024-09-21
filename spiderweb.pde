PointSystem ps;
LineSystem ls;
PImage sprite;
PImage bg;
RandomGen r = new RandomGen();
import java.lang.Math;

void setup() {
  size(1000, 562, P2D);
  frameRate(60);
  
  sprite = loadImage("sprite.png");
  bg = loadImage("gradient.png");
  
  ps = new PointSystem(100);
  ls = new LineSystem(ps);
} 

void draw() {
  background(bg);
  
  ps.update();
  ls.display();
  ps.display();
  
  //fill(255);
  //textSize(16);
  //text(int(frameRate),10,20);
}
