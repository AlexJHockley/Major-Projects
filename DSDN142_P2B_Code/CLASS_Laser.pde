class Laser {
 float x, y, z;  //Co-ords for laser
 
 float DPS;  //Damage per second of laser
 float totalDamage;  //The damage the laser will do overall
 int rotation;  //If the laser needs to be rotated
 
 float laserDuration;  //The length of time the laser runs for
 float laserStartTime;  //The start time of the laser
 float lastLaserDamage;  //The time when the laser last did damage
 
 float damageInterval;  //The interval between damages
 float totalDamageDone;  //The total damage done by the laser so far
 
 float laserHits;  //The number of hits the laser should do damage on. This doesnt always work due to processings running speed
 
 color col;  //The color of the laser
 
 PShape laser;  //the laser shape itself
 PShape laserTrail;  //The laser animation
 
 boolean laserFinished;  //if the laser is finished or not

  Laser(float X, float Y, float Z, float DTotal, int R, color C) {  //Initialize variables
   x = X;  
   y = Y;
   z = Z;
   
   laserDuration = 2000;
   
   laserHits = (int)(DTotal);
   
   totalDamage = (int)(DTotal);
   DPS = DTotal / laserHits;
   rotation = R;
   col = C;
   
   laser = Laser;
   laserTrail = LaserTrail;
   laserStartTime = millis();
   
   laserFinished = false;
   lastLaserDamage = 0;
   
   totalDamageDone = 0;
   
   damageInterval = (laserDuration) / (laserHits);
  }

  void drawLaser() {
   if (laserFinished == false) {  //Checks if laser still firing
     if (millis() - laserStartTime < laserStartTime - millis() + laserDuration) {  //Checks if the laser should still be firing
        if (millis() - lastLaserDamage > damageInterval) {  //Checks if its time to do damage again
          lastLaserDamage = millis();
        }
        if (ShieldOneActive && col == PlayTwoCol) {
        pushMatrix();  //draws laser
        translate(x, y, z); 
        fill(col, 70);
        shapeMode(CORNER);
        rotate(radians(rotation));
        scale(width / 53.3333333333 + random(-0.5, 0.5));
        pushMatrix();
        shape(LaserShield, 0, 0);
        popMatrix();
        rotateX(radians(totalDamageDone * totalDamage));
        fill(col, 80);
        shape(LaserTrailShield, 0, 0);
        popMatrix();
        }
        else if (ShieldTwoActive && col == PlayOneCol) {
        pushMatrix();  //draws laser
        translate(x, y, z); 
        fill(col, 70);
        shapeMode(CORNER);
        rotateX(radians(180));
        scale(width / 53.3333333333 + random(-0.5, 0.5));
        pushMatrix();
        shape(LaserShield, 0, 0);
        popMatrix();
        rotateX(radians(totalDamageDone * totalDamage));
        fill(col, 80);
        shape(LaserTrailShield, 0, 0);
        popMatrix();
        }    
        else {
        pushMatrix();  //draws laser
        translate(x, y, z); 
        rotate(radians(rotation));
        fill(col, 70);
        shapeMode(CORNER);
        scale(width / 56.4705882353 + random(-0.5, 2));
        pushMatrix();
        rotateX(radians(random(-6, 6)));
        shape(laser, 0, 0);
        popMatrix();
        rotateX(radians(totalDamageDone * totalDamage));
        fill(col, 50);
        shape(laserTrail, 0, 0);
        popMatrix(); 
        }
     }
     else {
      laserFinished = true; 
     }
   }
  }
  
  void damage() {
    if (getPlayer() == 1) {  //does the damage to the player
      totalDamageDone += DPS;  //Records the total damage overall
      damageTwo(DPS);
    }
    else if (getPlayer() == 2) {
      totalDamageDone += DPS;
      damageOne(DPS);
    }
  }
 
 float getRemainingDamage() {  //Returns the damage that needs to be done after laser is finished
                             //it is necessary to do this as Processing doesnt always do the right amount (due to sim speed)
  float remainingDamage = totalDamage - totalDamageDone;  
  return remainingDamage; 
 }
 
 boolean laserFinished() {
  return laserFinished; 
 }
 
 float getDPS() {
  return DPS; 
 }
 
  float getX() {
   return x; 
 }
 
 float getY() {
   return y;
 }
 
 float getZ() {
   return z;
 }
 
 color getCol() {
  return col; 
 }
 
 float endX() {
  if (col == PlayOneCol) {
   return LaserTwoX;
  }
  else if (col == PlayOneCol) {
   return LaserOneX; 
  }
  return 0;
 }
 
 float getDamage() {
  return DPS; 
 }
 
 int getPlayer() {  //Gets the player the bullet belongs to
   if (col == PlayOneCol) {
    return 1; //Player one owns this bullet
   }
   else if (col == PlayTwoCol) {
    return 2;   //Player that owns bullet is player 2
   }
   return 0;  //Player not known
 }
  }
  
  