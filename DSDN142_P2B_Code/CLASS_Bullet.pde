class Bullet {
 float x, y, z;  //Co-Ordinates
 int damage;   //The damage value of the bullets
 int velo;     //The velocity of the bullet, basically change in x value
 int rotation;  //The direction of the bullet, either coming from left or from right
 color col;  //The colour of the bullet
 boolean reachedTarget;  //If the bullet has reached its target or not
 
 float distTravelled = 0;  //The distance the bullet has travelled. Used to tell if reached target
 
 Bullet(float X, float Y, float Z, int DAMAGE, int VELO, int ROT, color COL) {
  x = X;    //Initialise all variables
  y = Y;
  z = Z;
  damage = DAMAGE;
  velo = VELO;
  rotation = ROT;
  col = COL;
  reachedTarget = false;
 }
 
 void drawBullet() {  //Draws the bullet shape
   if (reachedTarget == true) {  //If bullet reached target
    return;
   }
   
   pushMatrix();  
   translate(x, y, z);    //Translate and rotate into place
   rotateY(radians(rotation));
   scale(width / 38.4);
   fill(col);
   shape(BulletOuter, 0, 0);
   fill(col, 125);
   shape(BulletInner, 0, 0);
   fill(col, 80);
   shape(BulletTrail, 0, 0);
   popMatrix();
   x += velo;  //Adjust variables
   distTravelled += abs(velo);
   
   if (ShieldOneActive && col == PlayTwoCol) {
     if (distTravelled >= DistBetweenShips - width / 5) {
       reachedTarget = true;
     }
   }
   else if (ShieldTwoActive && col == PlayOneCol) {
    if (distTravelled >= DistBetweenShips - width / 5) {
      reachedTarget = true; 
    }
   }
   else if (distTravelled >= DistBetweenShips) {
      reachedTarget = true; 
   }
 }
 
 /* Get and set methods */

 int getDamage() {
   return damage;
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
 
 int getPlayer() {  //Gets the player the bullet belongs to
   if (col == PlayOneCol) {
    return 1; //Player one owns this bullet
   }
   else if (col == PlayTwoCol) {
    return 2;   //Player that owns bullet is player 2
   }
   return 0;  //Player not known
 }
 
 boolean reachedTarget() {
   return reachedTarget;
 }

 void setReachedTarget(boolean RT) {
  reachedTarget = RT; 
 }
  
}