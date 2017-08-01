void drawStartup() {  //Draws the background and the ships
 drawBackground();
 drawShips();
 drawUI();
}

void drawBackground() {  //Draws the background
 PImage bg = Images.get(ImageCount);
 background(bg);
 if (DrawBackgroundFlash) {
   ImageCount++;
   if (ImageCount > MaxImages - 1) {
    ImageCount = 0; 
   }
 }
}

void drawShips() {  //Draws the two ships
//pushMatrix();
// fill(0);
// translate(X1, Y1 + 25 - 70 + .5, -29 - 2.5);
// line(0, 0, 375, 0);
// translate(375, 0, 0);
// sphere(2);
// popMatrix();
 
// pushMatrix();
// fill(0);
// translate(X1, Y1 - 173.5, 125.25);
// line(0, 0, 287, 0);
// translate(287, 0, 0);
// sphere(2);
// popMatrix();

// pushMatrix();
// fill(0);
// translate(X1, Y1 - 173.5, -125.25);
// line(0, 0, 287, 0);
// translate(287, 0, 0);
// sphere(2);
// popMatrix();
 
 pushMatrix();  //Draws first ship
 translate(X1, Y1, Z1);
 scale(width / 38.4);
 shapeMode(CORNER);
 fill(PlayOneCol);
 shape(ShipOne, 0, 0);
 shape(ShipOneFill, 0, 0);
 fill(PlayOneCol, 80);
 if ((millis() / 1000) % 2 == 0) {  //Each second, switch the ship thrust display
   shape(ShipThrust, 0, 0);
 }
 else {
   shape(ShipThrust2, 0, 0); 
 }
 popMatrix();
 
 pushMatrix();  //Draws second ship
 translate(X2, Y2, Z2);
 shapeMode(CORNER);
 scale(width / 38.4);
 //rotateX(PI);
 //rotateZ(PI);
 fill(PlayTwoCol);
 shape(ShipTwo, 0, 0);
 shape(ShipTwoFill, 0, 0);
 fill(PlayTwoCol, 80);
 if ((millis() / 1000) % 2 == 1) {  //Each second, switch the ship thrust display. Opposite to first ship
   shape(ShipThrust, 0, 0);
 }
 else {
   shape(ShipThrust2, 0, 0); 
 }
 popMatrix();
}

void drawBulletFireOne(float adjust) {
 pushMatrix();
 translate(BulletOneX, BulletOneY, BulletOneZ + adjust);
 rotateY(radians(180));
 rotateX(radians(random(361)));
 shapeMode(CORNER);
 scale(width / 64);
 fill(PlayOneCol, 120);
 shape(BulletFireExplosion, 0, 0);
 popMatrix();
}

void drawBulletFireTwo(float adjust) {
 pushMatrix();
 translate(BulletTwoX, BulletTwoY, BulletTwoZ + adjust);
 shapeMode(CORNER);
 scale(width / 64);
 fill(PlayTwoCol, 120);
 shape(BulletFireExplosion, 0, 0);
 popMatrix();
}

void drawExplosion(float x, float y, float z, color col) {  //Draws an explosion of the given colour at the given point
  pushMatrix();
  shapeMode(CORNER);
  translate(x, y, z);
  fill(col, 90);
  rotate(random(20));  //Randomly rotates the explosion, for variety
  scale(width / 96);
  shape(Explosion, 0, 0);
  popMatrix();
}

void drawDeath(float x, float y, float z, color col) {  //Draws the death animation of a ship, including the text telling the player what happened
  pushMatrix();
  shapeMode(CORNER);
  translate(x, y, z);
  scale(width / 48);
  fill(col, 100);
  shape(Death, 0, 0);
  popMatrix();
  
  pushMatrix();
  rotateX(radians(0));
  translate(width / 2, height / 2, -height);
  if (col == PlayOneCol) {  //If the current ship dying is player one
    textSize(width / 17.5);
    textAlign(CENTER);
    fill(col);
    text("Player One Wins! Game Over!", 0, 0);
  }
  else if (col == PlayTwoCol) {  //If the current ship dying is player two
    textSize(width / 17.5);
    textAlign(CENTER);
    fill(col);
    text("Player Two Wins! Game Over!", 0, 0);
  }
  popMatrix();
  
}