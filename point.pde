class Point {
  PVector position;
  PVector velocity;
  float angvel;
  int turnTimer;
  float angacc;
  
  PShape poin;
  float poinSize = 6;
  
  Point() {
    // The particle is a textured quad
    poin = createShape();
    poin.beginShape(QUAD);
    poin.noStroke();
    poin.texture(sprite);
    poin.normal(0, 0, 1);
    poin.vertex(-poinSize/2, -poinSize/2, 0, 0);
    poin.vertex(+poinSize/2, -poinSize/2, sprite.width, 0);
    poin.vertex(+poinSize/2, +poinSize/2, sprite.width, sprite.height);
    poin.vertex(-poinSize/2, +poinSize/2, 0, sprite.height);
    poin.endShape();

    // Initialize center vector
    position = new PVector(); 
    
    // Set the particle starting location
    birth();
  }
  
  void birth() {
    float x = r.generate(width);
    float y = r.generate(height);
    float a = r.generate(TWO_PI);
    float speed = r.generate(0.2, 0.4);
    // A velocity with random angle and magnitude
    velocity = PVector.fromAngle(a);
    velocity.mult(speed);
    // Set location using translate
    poin.resetMatrix();
    poin.translate(x, y); 
    
    turnTimer=r.generate(10, 30);
    angvel=0;
    angacc=r.generate(0.03);
    
    // Update center vector
    position.set(x, y, 0);
  }
  
  PShape getShape() {
    return poin;
  }
  
  void bounce() {
    if (position.x+poinSize/2 > width  || position.x-poinSize/2 < 0) {
      velocity.x*=-1;
    }
    if (position.y+poinSize/2 > height || position.y-poinSize/2 < 0) {
      velocity.y*=-1;
    }
  }
  
  void turn() {
    if (turnTimer>0) turnTimer-=velocity.mag();
    if (turnTimer<=0) {
      turnTimer=r.generate(30, 200);
      angacc*=-1;
    }
    
    angacc=Math.signum(angacc)*r.generate(0.03); //<>//
    angvel+=angacc;
    velocity.rotate(angacc);
    
  }
  
  void update() {
    bounce();
    turn();
    poin.translate(velocity.x, velocity.y);
    
    position.add(velocity);
  }

}
