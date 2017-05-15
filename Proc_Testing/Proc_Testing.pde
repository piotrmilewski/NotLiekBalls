Ball[] balls;

boolean RS; //ReactionStarted
float r = random(256);
float g = random(256);
float b = random(256);

void setup() { //sets up the animation
  size(700, 700); //set the window size
  background(r, g, b); //set random background
  RS = false;
  balls = new Ball[25];
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball();
  }
  balls[balls.length-1].setRadius(0); //last ball is a holder for the reaction
}

void draw() { //loop
  background(r, g, b); //refreshes background and clears trail
  for (Ball ball : balls) {
    if (ball.getState() == 3) {
      ball = null;
    } else {
      if (RS) { //if Reaction has started
        for (Ball b : balls) {
          if (b.getState() == 1 || b.getState() == 2) { //compare the current ball to the reactive balls
            if (ball.distance(b) < ball.getRadius() + b.getRadius()) { //if the distance from the current ball to a reactive ball is less than the sum of their radii, then they are in contact
              if (ball.getState() != 2) {
                ball.setState(1); //if they touch then current ball becomes part of the Chain Reaction
              }
            }
          }
        }
      }
      ball.move(); //moves ball depending on ball's state
    }
  }
}

void mouseClicked() { //reads mouse clicks
  if (!RS) {
    RS = true; //starts reaction
    balls[balls.length-1].setRadius(balls[balls.length-1].getOrigRadius()); //sets holder's radius to radius of other balls
    balls[balls.length-1].setState(1); //makes holder reactive
    balls[balls.length-1].setxy(mouseX, mouseY); //sets holder's position to wherever the mouse was clicked
  }
}