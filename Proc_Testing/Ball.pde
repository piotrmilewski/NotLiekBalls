class Ball {

  float x;
  float y;
  float orad;
  float rad;
  color c;
  float dx;
  float dy;
  int state; //0 = normal, 1 = reacting
  float grow; //increase radius by set size
  float max; //max radius for reacting balls

  Ball() {

    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color( r, g, b);
    rad = 25;
    x = random((width - rad) + rad/2);
    y = random((height - rad) + rad/2);
    dx = random(10) - 5;
    dy = random(10) - 5;
    state = 0;
    grow = 1;
    max = 50;
    ellipseMode(CENTER);
    fill(c);
  } 

  int getState() {
    return state;
  }
  
  float getRadius() {
    return rad;
  }
  
  void setState(int x) {
    state = x;
  }
  
  void setRadius(float x) {
    rad = x;
  }
  
  void setxy(int nx, int ny) {
    x = nx;
    y = ny;
  }

  void move() {
    if (state == 1){
      expand();
    }
    ellipse(x, y, rad * 2, rad * 2);
    x = x + dx;
    y = y + dy;
    bounce();
    fill(color(random(256), random(256), random(256)));
  }

  void bounce() {
    if (x > width || x < 0) {
      dx *= -1;
    }

    if (y > height || y < 0) {
      dy *= -1;
    }
  }

  void expand() {
    dx = 0;
    dy = 0;
    if (rad > 0 && rad < max) {
      rad += grow;
    }
  }
  
  float sqdistance(Ball ball) {
    return sqrt(pow((x-ball.x), 2) + pow((y-ball.y), 2));
  }
}