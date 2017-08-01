void drawBullets() {
 for (int i = 0; i < bullets.size(); i++) {
  Bullet temp = bullets.get(i);
  if (temp.reachedTarget() == true) {
   drawExplosion(temp.getX(), temp.getY(), temp.getZ(), temp.getCol());
   if (temp.getPlayer() == 1) {
    damageTwo(temp.getDamage()); 
   }
   else if (temp.getPlayer() == 2) {
     damageOne(temp.getDamage());
   }
   bullets.remove(i);
  }
  else {
   temp.drawBullet(); 
  }
 }
}

void drawLasers() {
 for (int i = 0; i < lasers.size(); i++) {
   Laser temp = lasers.get(i);
   if (temp.laserFinished() == true) {
    lasers.remove(i);
    
    if (temp.getPlayer() == 1) {
      damageTwo(temp.getRemainingDamage());
    }
    else if (temp.getPlayer() == 2) {
      damageOne(temp.getRemainingDamage());
    }
  }
  else {
   temp.drawLaser();
   temp.damage();
  }
 }
}

void drawShieldOne(color fill) {
 if (ShieldOneActive) {
 pushMatrix();
 translate(X1, Y1);
 scale(width / 38.4);
 fill(fill, 80);
 shape(ShieldOne, 0, 0);
 popMatrix();
 }
}

void drawShieldTwo(color fill) {
 if (ShieldTwoActive) {
   pushMatrix();
   translate(X2, Y2, Z2);
   scale(width / 38.4);
   fill(fill, 80);
   shape(ShieldTwo, 0, 0);
   popMatrix();
 }
}


void checkHP() {
 checkHPOne();
 checkHPTwo();
}

void checkHPOne() {
  if (HPOne <= 0 && !GameOver) {
   drawDeath(LaserOneX - ShipWidth / 2, LaserOneY, LaserOneZ, PlayTwoCol); 
   GameOver = true;
   drawUI();
  }
}

void checkHPTwo() {
  if (HPTwo <= 0 && !GameOver) {
   drawDeath(LaserTwoX + ShipWidth / 2, LaserTwoY, LaserTwoZ, PlayOneCol);
   GameOver = true;
   drawUI();
  }
}

void damageOne(float damage) {
  if (!ShieldOneActive) {
    HPOne -= damage;
  }
  else {
    drawShieldOne(255); 
  }
}

void damageTwo(float damage) {
  if (!ShieldTwoActive) {
    HPTwo -= damage;
  }
  else {
   drawShieldTwo(255); 
  }
}

void checkShields() {
 if (ShieldOneActive) {
   if (millis() >= ShieldFireOne + ShieldCooldown / 3) {
     ShieldOneActive = false;
   }
   else {
    drawShieldOne(PlayOneCol); 
   }
 }
 if (ShieldTwoActive) {
   if (millis() >= ShieldFireTwo + ShieldCooldown / 3) {
     ShieldTwoActive = false;
   }
   else {
    drawShieldTwo(PlayTwoCol); 
   }
 }
}