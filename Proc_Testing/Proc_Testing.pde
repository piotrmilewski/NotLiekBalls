Ball[] balls;

boolean RS;
float r = random(256);
float g = random(256);
float b = random(256);

void setup() {
  size(700, 700);
  background(153, 50, 204);
  RS = false;
  balls = new Ball[25];
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball();
  }
  balls[balls.length-1].setRadius(0);
}

void draw() {
  background(random(256), random(256), random(256));
  for (Ball ball : balls) {
    if (RS) {
      for (Ball b : balls) {
        if (b.getState() == 1) {
          if (ball.sqdistance(b) < ball.getRadius() + b.getRadius()) {
            ball.setState(1);
          }
        }
      }
    }
    ball.move();
  }
}

void mouseClicked() {
  RS = true;
  Ball b = new Ball();
  b.setState(1);
  b.setxy(mouseX, mouseY);
  balls[balls.length-1] = b;
}