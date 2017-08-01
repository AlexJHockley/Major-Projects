/** The font used can be found here: 
http://www.1001fonts.com/destructobeam-bb-font.html  **/

/** NOTE: You can change the resolution below, by switching the comments around **/

void setup() {
 size(1280, 720, P3D);
 //size(1920, 1080, P3D);
 
 frameRate(25);
 drawLoadScreen();
 drawStartScreen();
 startGame();
} 

void draw() {
  if (MenuUp) {
   drawStartScreen(); 
   if (mousePressed) {
    for (int i = 0; i < 9; i++) {
      ColorBox box = BoxesOne.get(i);
      //println("MouseX: " + mouseX + " MouseY: " + mouseY + " BoxX: " + box.getX() + " BoxY: " + box.getY());
      if (box.detectClick(mouseX, mouseY) == true) {
          PlayOneCol = box.getCol(); 
    }
   }
   for (int i = 0; i < 9; i++) {
      ColorBox box = BoxesTwo.get(i);
      if (box.detectClick(mouseX, mouseY) == true) {
          PlayTwoCol = box.getCol(); 
      }
   }
  }
  }
  if (GameOver == false && !MenuUp) {
   spotLight(253, 234, 209, CameraX, CameraY, -CameraZ, CameraX, CameraY, CameraZ, 2 * PI, 0);
   spotLight(253, 234, 209, CameraX, CameraY, CameraZ, CameraX, CameraY, CameraZ, 2 * PI, 0);
   drawStartup();
   drawBullets();
   drawLasers();
   checkHP();
   checkShields();
  }
  
  /** Code for images and videos **/
  //if (frameCount <= 500) {
  //saveFrame("frame/####.png"); 
  //}
  //if (keyPressed) {
  //  if (key == ']') {
  //saveFrame("P2B_Screenshot.png"); 
  //  }
  //}
}




void keyPressed() {
  if (MenuUp && keyPressed) {
    MenuUp = false;
    placeCamera();
    draw();
  }
  
  
  /* Player One Controls */
  else if (!GameOver) {
  if (key == 'w' || key == 'W') {
    if (millis() >= LFireOne + LaserCooldown) {
     LFireOne = millis();
     lasers.add(new Laser(LaserOneX, LaserOneY, LaserOneZ, LaserDamage, 0, PlayOneCol));
    }
    else { 
      laserCDPlayOne(); 
    }
  }
  else if (key == 'q' || key == 'Q') {
   if (millis() >= BFireOne + BulletCooldown) {
     BFireOne = millis();
     if (EvenBulletFireOne) {
       bullets.add(new Bullet(BulletOneX, BulletOneY, BulletOneZ - BulletAdjustment, BulletDamage, BulletVelo, 0, PlayOneCol));
       drawBulletFireOne(-BulletAdjustment);
       EvenBulletFireOne = false;
     }
     else {
       bullets.add(new Bullet(BulletOneX, BulletOneY, BulletOneZ, BulletDamage, BulletVelo, 0, PlayOneCol));
       drawBulletFireOne(0);
       EvenBulletFireOne = true;
     }
   }
   else { 
      bulletCDPlayOne();
    }
  }
  else if (key == 'e' || key == 'E') {
    if (millis() >= ShieldFireOne + ShieldCooldown) {
     ShieldFireOne = millis();
     ShieldOneActive = true; 
    }
    else { 
      shieldCDPlayOne();
    }
  }
  
  
  /* Player Two Controls */
  else if (key == '2') {
    if (millis() >= LFireTwo + LaserCooldown) {
      LFireTwo = millis();
      lasers.add(new Laser(LaserTwoX, LaserTwoY, LaserTwoZ, LaserDamage, 180, PlayTwoCol));
    }
    else { 
      laserCDPlayTwo();
    }
  }
  else if (key == '1') {
    if (millis() >= BFireTwo + BulletCooldown) {
     BFireTwo = millis();
     if (EvenBulletFireTwo) {
       bullets.add(new Bullet(BulletTwoX, BulletTwoY, BulletTwoZ + BulletAdjustment, BulletDamage, -BulletVelo, 180, PlayTwoCol));
       drawBulletFireTwo(BulletAdjustment);
       EvenBulletFireTwo = false;
     }
     else {
       bullets.add(new Bullet(BulletTwoX, BulletTwoY, BulletTwoZ, BulletDamage, -BulletVelo, 180, PlayTwoCol));
       drawBulletFireTwo(0);
       EvenBulletFireTwo = true;
     }
     
    }
    else { 
      bulletCDPlayTwo();
    }
  }
  else if (key == '3') {
    if (millis() >= ShieldFireTwo + ShieldCooldown) {
     ShieldFireTwo = millis();
     ShieldTwoActive = true; 
    }
    else { 
      shieldCDPlayTwo();
    }
  }
  else if (key == 'b' || key == 'B') {
   DrawBackgroundFlash = !DrawBackgroundFlash; 
  }
  }
  else if (GameOver) {
    if (key == 'n' || key == 'N') {
     drawLoadScreen();
     restartGame();
    }
  }
  
  /* Debug Controls */
  //else if (key == '[') {
  // drawExplosion(X, Y, Z, color(255, 220, 250));
  //}
  //else if (key == '.') {
  //  HPTwo -= 10;
  //}
  //else if (key == ',') {
  //  HPOne -= 10;
  //}
  //else if (key == ';') {
  //  HPOne = 100;
  //  HPTwo = 100;
  //} 
  //else if (key == '-') {
  // styleShapes();
  // drawStartup();
  //}
}