class Ball {

  float x; //x position
  float y; //y position
  float orad; //original radisu of ball
  float rad; //current radius of ball
  color c; //color of ball
  float dx; //x speed
  float dy; //y speed
  int state; //0 = normal, 1 = reacting, 2 = shrinking
  float grow; //increase radius by set size
  float shrink; //decrease radius by set size
  float max; //max radius for reacting balls

  Ball() {
    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color( r, g, b);
    orad = 25;
    rad = 25;
    x = random((width - rad) + rad/2);
    y = random((height - rad) + rad/2);
    dx = random(10) - 5;
    dy = random(10) - 5;
    state = 0;
    grow = 1;
    shrink = 0.2;
    max = 50;
    ellipseMode(CENTER);
    fill(c);
  } 

  int getState() { //returns current state of ball
    return state;
  }

  float getRadius() { //returns current radius of ball
    return rad;
  }
  
  float getOrigRadius() { //returns original radius of ball
    return orad;
  }

  void setState(int x) { //sets state of ball
    state = x;
  }

  void setRadius(float x) { //sets radius of ball
    rad = x;
  }

  void setxy(int nx, int ny) { //sets x and y position of ball
    x = nx;
    y = ny;
  }

  void move() { //moves the ball around
    if (state == 1) { //if state is 1 then expand the ball
      expand();
    }
    else if (state == 2){
      shrink();
    }
    if (rad >= max){
      state = 2;
    }
    ellipse(x, y, rad * 2, rad * 2); //draws the ball
    x = x + dx; //moves ball dx units in x direction
    y = y + dy; //moves ball dx units in y direction
    bounce();
  }

  void bounce() { //if ball hits border, then bounces off of border
    if (x > width || x < 0) { //if hits side edges then reverse x direction
      dx *= -1;
    }

    if (y > height || y < 0) { //if hits top or bottom edge then reverse y direction
      dy *= -1;
    }
  }

  void expand() { //increases radius of ball to its max
    dx = 0; //stops x movement
    dy = 0; //stops y movement
    if (rad > 0 && rad < max) { //if 0 < ball radius < max, then inflate ball
      rad += grow;
    }
  }
  
  void shrink() { //decrease radius of ball to 0
    if (rad >= 0.0) {
      rad -= shrink;
    }
  }

  float distance(Ball ball) { //returns the distance between the current ball and the parameter ball
    return sqrt(pow((x-ball.x), 2) + pow((y-ball.y), 2));
  }
}