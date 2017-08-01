void drawUI() {
 drawUIBackgrounds();
 checkHPOne();
 checkHPTwo();
 drawHealth();
 //drawHPText();
 drawCooldowns();
 //drawCooldownText();
 //drawUIForeground();
}

void drawUIBackgrounds() {
  /** Player One **/
  pushMatrix();
  shapeMode(CORNER);
  translate(width / 2.6, Y - height / 1.5, width / 3);
  rotateX(radians(0));
  rotateY(radians(-60));
  rotateZ(radians(40));
  fill(PlayOneCol, 50);
  scale(width / 96);
  shape(Screen, 0, 0);
  popMatrix();
  
  /** Player Two **/
  pushMatrix();
  shapeMode(CORNER);
  translate(width - width / 2.6, Y - height / 1.5, width / 3);
  rotateX(radians(0));
  rotateY(radians(-120));
  rotateZ(radians(40));
  fill(PlayTwoCol, 40);
  scale(width / 96);
  shape(Screen, 0, 0);
  popMatrix();
}

void drawHealth() {
  /** Player One **/
  shapeMode(CORNER);
  pushMatrix();
  translate(width / 2.8, Y - height / 1.5, width / 3);
  rotateX(radians(0));
  rotateY(radians(-60));
  rotateZ(radians(40));
  translate(height / 40, 0, -width / 11);
  
  pushMatrix();
  textAlign(CORNER);
  textSize(width / 76.8);
  rotateY(radians(180));
  rotateX(radians(90));
  rotateZ(radians(180));
  translate(-height / 15, height / 30, 0);
  fill(255, 200);
  text("Health: %" + (int)(HPOne / HPOneInitial * 100), 0, 0);
  popMatrix();
  
  rotateX(radians( + millis() / 100));
  pushMatrix();
  if (HPOne <= 30) {
   fill(255, 0, 0, 90); 
  }
  else {
    fill(0, 255, 0, 90);
  }
  scale(HPOne / HPOneInitial * (width / 19.2), width / 240, width / 240);
  shape(Box, 0, 0);
  popMatrix();
  if (GameOver) {
   fill(0, 200); //If there is no health left, draw over the bar in black
  }
  else {
    fill(255, 30);
  }
  scale(width / 19.0099009901, width / 192, width / 192);
  shape(Box, 0, 0);
  popMatrix();
  
  /** Player Two **/
  shapeMode(CORNER);
  pushMatrix();
  translate(width - width / 2.8, Y - height / 1.5, width / 3);
  rotateX(radians(0));
  rotateY(radians(-120));
  rotateZ(radians(70));
  translate(-height / 20, -width / 19.2, width / 12);
  rotateX(radians(90));
  rotateY(radians(-45 + 105));
  pushMatrix();
  textSize(width / 81.7021276596);
  rotateY(radians(90));
  rotateX(radians(180));
  rotateZ(radians(0));
  translate(-height / 12, height / 32.5, 0);
  fill(255, 200);
  text("Health: %" + (int)(HPTwo / HPTwoInitial * 100), 0, 0);
  popMatrix();

  
  rotateZ(radians( + millis() / 100));
  pushMatrix();
  if (HPTwo <= 30) {
   fill(255, 0, 0, 90); 
  }
  else {
    fill(0, 255, 0, 90);
  }
  scale(width / 240, width / 240, HPTwo / HPTwoInitial * (width / 21.3333333333));
  shape(Cylinder, 0, 0);
  popMatrix();
  if (GameOver) {
   fill(0, 200); //If there is no health left, draw over the bar in black
  }
  else {
    fill(255, 30);
  }
  scale(width / 192, width / 192, width / 21.0989010989);
  shape(Cylinder, 0, 0);
  popMatrix();
}

void drawCooldowns() {
  int cooldownPercentage = (int)constrain(map(BOneLastFire, 0, BulletCooldown, 0, width / 24), 0, width / 24);
  textSize(width / 106.666666667);
  
  /** Player One **/
  shapeMode(CORNER);
  textAlign(CORNER);
  BOneLastFire = millis() - BFireOne;
  pushMatrix();
  translate(width / 2.8, Y - height / 1.5, width / 3);
  rotateX(radians(0));
  rotateY(radians(-60));
  rotateZ(radians(70));
  translate(-height / 25, 0, width / 100);
  
  pushMatrix();
  rotateY(radians(90));
  rotateX(radians(140));
  translate(- height / 14.5, -height / 100, 0);
  fill(255, 200);
  text("Cannon Charge:", -height / 100, - height / 100);
  popMatrix();
  
  rotateZ(radians( + millis() / 100));
  pushMatrix();
  if (cooldownPercentage < 80) {
   fill(255, 90); 
   scale(width / 240, width / 240, cooldownPercentage);
  }
  else {
    fill(PlayOneCol, 90);
    scale(width / 240, width / 240, width / 24);
  }
  shape(Box, 0, 0);
  popMatrix();
  if (GameOver) {
   fill(0, 200); //If there is no health left, draw over the bar in black
  }
  else {
    fill(255, 30);
  }
  scale( width / 192,  width / 192, width / 23.7037037037);
  shape(Box, 0, 0);
  popMatrix();
  
  
  
  cooldownPercentage = (int)constrain(map(LOneLastFire, 0, LaserCooldown, 0, width / 24), 0, width / 24);
  shapeMode(CORNER);
  LOneLastFire = millis() - LFireOne;
  pushMatrix();
  translate(width / 2.6, Y - height / 1.5, width / 3);
  rotateX(radians(0));
  rotateY(radians(-60));
  rotateZ(radians(70));
  translate(height / 200, -height / 100, width / 29);
  
  pushMatrix();
  rotateY(radians(90));
  rotateX(radians(140));
  translate(- height / 14.5, 0, 0);
  fill(255, 200);
  text("Laser Charge:", -height / 100, - height / 50);
  popMatrix();
  
  rotateZ(radians( - millis() / 100));
  pushMatrix();
  if (cooldownPercentage < 80) {
   fill(255, 90); 
   scale(width / 240, width / 240, cooldownPercentage);
  }
  else {
    fill(PlayOneCol, 90);
    scale(width / 240, width / 240, width / 24);
  }
  shape(Box, 0, 0);
  popMatrix();
  if (GameOver) {
   fill(0, 200); //If there is no health left, draw over the bar in black
  }
  else {
    fill(255, 30);
  }
  scale( width / 192,  width / 192, width / 23.7037037037);
  shape(Box, 0, 0);
  popMatrix();
  
  
  cooldownPercentage = (int)constrain(map(ShieldOneLastFire, 0, ShieldCooldown, 0, width / 24), 0, width / 24);
  shapeMode(CORNER);
  ShieldOneLastFire = millis() - ShieldFireOne;
  pushMatrix();
  translate(width / 2.6, Y - height / 1.5, width / 3);
  rotateX(radians(0));
  rotateY(radians(-60));
  rotateZ(radians(70));
  translate(height / 20, -height / 20, width / 29);
  
  pushMatrix();
  rotateY(radians(90));
  rotateX(radians(140));
  translate(- height / 14.5, 0, 0);
  fill(255, 200);
  text("Shield Charge:", -height / 100, - height / 50);
  popMatrix();
  rotateZ(radians( + millis() / 100));
  pushMatrix();
  
  if (cooldownPercentage < 80) {
   fill(255, 90); 
   scale(width / 240, width / 240, cooldownPercentage);
  }
  else {
    fill(PlayOneCol, 90);
    scale(width / 240, width / 240, width / 24);
  }
  shape(Box, 0, 0);
  popMatrix();
  if (GameOver) {
   fill(0, 200); //If there is no health left, draw over the bar in black
  }
  else {
    fill(255, 30);
  }
  scale( width / 192,  width / 192, width / 23.7037037037);
  shape(Box, 0, 0);
  popMatrix();
  
  
  
  
  
  
  /** Player Two **/
  
  cooldownPercentage = (int)constrain(map(BTwoLastFire, 0, BulletCooldown, 0, width / 24), 0, width / 24);

  shapeMode(CORNER);
  BTwoLastFire = millis() - BFireTwo;
  pushMatrix();
  translate(width - width / 2.8, Y - height / 1.5, width / 3);
  rotateX(radians(0));
  rotateY(radians(-120));
  rotateZ(radians(70));
  translate(-height / 20, 0, -width / 150);
  
   pushMatrix();
  rotateY(radians(90));
  rotateX(radians(140));
  translate(- height / 14.5, -height / 100, 0);
  fill(255, 200);
  text("Cannon Charge:", -height / 100, - height / 100);
  popMatrix();
  
  rotateZ(radians( + millis() / 100));
  pushMatrix();
  if (cooldownPercentage < 80) {
   fill(255, 90); 
   scale(width / 240, width / 240, cooldownPercentage);
  }
  else {
    fill(PlayTwoCol, 90);
    scale(width / 240, width / 240, width / 24);
  }
  shape(Cylinder, 0, 0);
  popMatrix();
  if (GameOver) {
   fill(0, 200); //If there is no health left, draw over the bar in black
  }
  else {
    fill(255, 30);
  }
  scale( width / 192,  width / 192, width / 23.7037037037);
  shape(Cylinder, 0, 0);
  popMatrix();
  
  
  
  cooldownPercentage = (int)constrain(map(LTwoLastFire, 0, LaserCooldown, 0, width / 24), 0, width / 24);
  shapeMode(CORNER);
  LTwoLastFire = millis() - LFireTwo;
  pushMatrix();
  translate(width - width / 2.8, Y - height / 1.5, width / 3);
  rotateX(radians(0));
  rotateY(radians(-120));
  rotateZ(radians(70));
  translate( -height / 100, -height / 20, -width / 150);
  
  pushMatrix();
  rotateY(radians(90));
  rotateX(radians(140));
  translate(- height / 14.5, 0, 0);
  fill(255, 200);
  text("Laser Charge:", -height / 100, - height / 50);
  popMatrix();
  
  rotateZ(radians( - millis() / 100));
  pushMatrix();
  if (cooldownPercentage < 80) {
   fill(255, 90); 
   scale(width / 240, width / 240, cooldownPercentage);
  }
  else {
    fill(PlayTwoCol, 90);
    scale(width / 240, width / 240, width / 24);
  }
  shape(Cylinder, 0, 0);
  popMatrix();
  if (GameOver) {
   fill(0, 200); //If there is no health left, draw over the bar in black
  }
  else {
    fill(255, 30);
  }
  scale( width / 192,  width / 192, width / 23.7037037037);
  shape(Cylinder, 0, 0);
  popMatrix();
  
  cooldownPercentage = (int)constrain(map(ShieldTwoLastFire, 0, ShieldCooldown, 0, width / 24), 0, width / 24);
  shapeMode(CORNER);
  ShieldTwoLastFire = millis() - ShieldFireTwo;
  pushMatrix();
  translate(width - width / 2.8, Y - height / 1.5, width / 3);
  rotateX(radians(0));
  rotateY(radians(-120));
  rotateZ(radians(70));
  translate(height / 15, -height / 15, -width / 150);
  
  pushMatrix();
  rotateY(radians(90));
  rotateX(radians(140));
  translate(- height / 14.5, 0, 0);
  fill(255, 200);
  text("Shield Charge:", -height / 100, - height / 50);
  popMatrix();
  
  rotateZ(radians( + millis() / 100));
  pushMatrix();
  if (cooldownPercentage < 80) {
   fill(255, 90); 
   scale(width / 240, width / 240, cooldownPercentage);
  }
  else {
    fill(PlayTwoCol, 90);
    scale(width / 240, width / 240, width / 24);
  }
  shape(Cylinder, 0, 0);
  popMatrix();
  if (GameOver) {
   fill(0, 200); //If there is no health left, draw over the bar in black
  }
  else {
    fill(255, 30);
  }
  scale( width / 192,  width / 192, width / 23.7037037037);
  shape(Cylinder, 0, 0);
  popMatrix();
}


void bulletCDPlayOne() {
  textSize(width / 160);
  textAlign(CENTER);
  pushMatrix();
  translate(width / 2.8, Y - height / 1.5, width / 3);
  rotateX(radians(0));
  rotateY(radians(-60));
  rotateZ(radians(70));
  translate(-height / 25, 0, width / 100);
  rotateY(radians(90));
  rotateX(radians(140));
  translate(height / 10, height / 100, 0);
  fill(255, 200);
  text("NOT", 0, 0);
  translate(0, height / 80, 0);
  text("CHARGED!", 0, 0);
  popMatrix();
}

void laserCDPlayOne() {
  textSize(width / 160);
  textAlign(CENTER);
  pushMatrix();
  translate(width / 2.6, Y - height / 1.5, width / 3);
  rotateX(radians(0));
  rotateY(radians(-60));
  rotateZ(radians(70));
  translate(height / 200, -height / 100, width / 29);
  rotateY(radians(90));
  rotateX(radians(140));
  
  translate(height / 10, height / 150, 0);
  fill(255, 200);
  text("NOT", 0, 0);
  translate(0, height / 70, 0);
  text("CHARGED!", 0, 0);
  popMatrix();
}

void shieldCDPlayOne() {
  textSize(width / 160);
  textAlign(CENTER);
  pushMatrix();
  translate(width / 2.6, Y - height / 1.5, width / 3);
  rotateX(radians(0));
  rotateY(radians(-60));
  rotateZ(radians(70));
  translate(height / 100, 0, width / 100);
  rotateY(radians(90));
  rotateX(radians(140));
  
  translate(height / 20, height / 13.5, 0);
  fill(255, 200);
  text("NOT", 0, 0);
  translate(0, height / 80, 0);
  text("CHARGED!", 0, 0);
  popMatrix();
}


void bulletCDPlayTwo() {
  textSize(width / 160);
  textAlign(CENTER);
  pushMatrix();
  translate(width - width / 2.8, Y - height / 1.5, width / 3);
  rotateX(radians(0));
  rotateY(radians(-120));
  rotateZ(radians(70));
  translate(-height / 20, 0, -width / 150);
  

  rotateY(radians(90));
  rotateX(radians(140));
  translate(-height / 10, height / 100, 0);
  fill(255, 200);
  text("NOT", 0, 0);
  translate(0, height / 80, 0);
  text("CHARGED!", 0, 0);
  popMatrix();
}

void laserCDPlayTwo() {
  textSize(width / 160);
  textAlign(CENTER);
  pushMatrix();
  translate(width - width / 2.8, Y - height / 1.5, width / 3);
  rotateX(radians(0));
  rotateY(radians(-120));
  rotateZ(radians(70));
  translate(-height / 20, height / 150, -width / 150);
  

  rotateY(radians(90));
  rotateX(radians(140));
  translate(-height / 10, height / 13.5, 0);
  fill(255, 200);
  text("NOT", 0, 0);
  translate(0, height / 80, 0);
  text("CHARGED!", 0, 0);
  popMatrix();
}

void shieldCDPlayTwo() {
  textSize(width / 160);
  textAlign(CENTER);
  pushMatrix();
  translate(width - width / 2.8, Y - height / 1.5, width / 3);
  rotateX(radians(0));
  rotateY(radians(-120));
  rotateZ(radians(70));
  translate(-height / 20, height / 150, -width / 150);
  

  rotateY(radians(90));
  rotateX(radians(140));
  translate(-height / 10, height / 7, 0);
  fill(255, 200);
  text("NOT", 0, 0);
  translate(0, height / 80, 0);
  text("CHARGED!", 0, 0);
  popMatrix();
}