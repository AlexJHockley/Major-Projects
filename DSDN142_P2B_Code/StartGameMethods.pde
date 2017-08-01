void startGame() {
  initializeVariables();
  //loadImages();
  
  loadShapes();
  if (!MenuUp) {
  placeCamera();
  }
}

void restartGame() {
  initializeVariables();
}

void initializeVariables() {
  /* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
                /* Misc Variables */
  Debug = true;                  FileType = ".obj";              Font = createFont("DestructoBeam BB", width / 21.3333333333, true);
  textFont(Font);
  
  
  /* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
                /* Translate and Rotate Variables */
  AngleX = 0;         AngleY = 0;         AngleZ = 0;
  
  
  /* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
                /* Camera Variables */
                
  CameraX = width / 2;      CameraY = -height / 2;      CameraZ = height;
  CamFocusX = width / 2;      CamFocusY = height / 2;       CamFocusZ = 0;
  CamAdjustX = 0;             CamAdjustY = 1;               CamAdjustZ = 0;
                
                /** Gun Focus (Change Z - to + to see other gun) **/
  //CameraX = width / 4;        CameraY = height / 3 + 5;        CameraZ = -125.25;
  //CamFocusX = width / 4.8;      CamFocusY = height / 3 + 5;       CamFocusZ = -125.25;
  //CamAdjustX = 0;             CamAdjustY = 1;               CamAdjustZ = 0;
                
  //CameraX = width / 4.8;        CameraY = height / 3;        CameraZ = 380;
  //CamFocusX = width / 4.8;      CamFocusY = height / 3;       CamFocusZ = 0;
  //CamAdjustX = 0;             CamAdjustY = 1;               CamAdjustZ = 0;
  
  //CameraX = width / 3;        CameraY = height /2 - 50;        CameraZ = -35;
  //CamFocusX = width / 4;      CamFocusY = height / 2 - 50;       CamFocusZ = 0;
  //CamAdjustX = 0;             CamAdjustY = 1;               CamAdjustZ = 0;
                
  //CameraX = width / 4;        CameraY = -height /2;        CameraZ = -35;
  //CamFocusX = width / 4;      CamFocusY = height / 2;       CamFocusZ = 0;
  //CamAdjustX = 0;             CamAdjustY = 1;               CamAdjustZ = 0;
  
  
  /* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
                /* GameFunction Variables */
  HPOneInitial = 100;        HPTwoInitial = 100;
  HPOne = HPOneInitial;      HPTwo = HPTwoInitial;
  HPOneShield = HPOneInitial;     HPTwoShield = HPTwoInitial;
  
  BulletDamage = 10;  LaserDamage = 30;   BulletVelo = 10;
  
  bullets = new ArrayList<Bullet>();    lasers = new ArrayList<Laser>();
  
  BulletCooldown = 750;      LaserCooldown = 5000;
  
  BFireOne = 0;    BFireTwo = 0;    LFireOne = 0;    LFireTwo = 0;
  BOneLastFire = 0;    BTwoLastFire = 0;    LOneLastFire = 0;    LTwoLastFire = 0;
  
  ShieldCooldown = 5500;    ShieldFireOne = 0;    ShieldFireTwo = 0;
  
  GameOver = false;
  
                 
  /* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
                /* Ship Property Variables */
  PlayOneCol = color(230, 0, 0);    PlayTwoCol = color(0, 0, 230); 
  ShipWidth = (width / 5.12) * 2;      DistBetweenShips = width / 1.45;
  
  
  /* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
                /* Co-Ords Variables */
  X = width / 2;      Y = width / 2;        Z = 0;
  X1 = width / 20;        Y1 = height / 2;    Z1 = 0;
  X2 = width - width / 20;    Y2 = height / 2;    Z2 = -width / 19.2;
  
  
  /* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
                     /* Shape Placement Fields */
  /** Bullet Placement Fields **/
     BulletOneX = X1 + width / 6.68989547038;     BulletOneY = Y1 - height / 6.22478386167;     BulletOneZ = Z1 + width / 15.2988047809;  //These fields dictate where each ships bullet is fired from, for correct placement
     BulletTwoX = X2 - width / 6.68989547038;     BulletTwoY = Y2 - height / 6.22478386167;     BulletTwoZ = Z2 - width / 15.2988047809;
     BulletAdjustment = width / 15.2988047809 * 2;  //The distance between the two guns, so the bullets can move between then
     EvenBulletFireOne = false;    EvenBulletFireTwo = false;
  
  /** Laser Placement Fields **/
     LaserOneX = X1 + ShipWidth / 2;     LaserOneY = Y1 - height / 24;     LaserOneZ = Z1 - width / 60.9523809524;
     LaserTwoX = X2 - ShipWidth / 2;     LaserTwoY = Y2 - height / 24;     LaserTwoZ = Z2 - width / 60.9523809524;
 
    
  /** Shield Placement Fields **/
     ShieldOneX = 0;     ShieldY = 0;     ShieldOneZ = 0;
     ShieldTwoX = 0;     ShieldTwoY = 0;     ShieldTwoZ = 0;
     

  /* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
                     /* Menu Fields */
     MenuUp = true;
     
     /* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
         /*  Background Variables */
ImageCount = 0;     MaxImages = 27;    DrawBackgroundFlash = true;
}

void styleShapes() {
  /** Shapes **/
  LaserShield.disableStyle();       Explosion.disableStyle();
  ShipOneFill.disableStyle();       BulletFireExplosion.disableStyle();
  ShipThrust.disableStyle();        Laser.disableStyle(); 
  ShieldOne.disableStyle();         ShieldTwo.disableStyle();
  LaserTrail.disableStyle();        BulletTrail.disableStyle();
  ShipThrust2.disableStyle();       Death.disableStyle();
  ShipTwoFill.disableStyle();       BulletInner.disableStyle();
  BulletOuter.disableStyle();       LaserTrailShield.disableStyle();
  
  
  Box.disableStyle();               Screen.disableStyle();
  Cylinder.disableStyle();
}

void placeCamera() {
 camera(CameraX, CameraY, CameraZ, CamFocusX, CamFocusY, CamFocusZ, CamAdjustX, CamAdjustY, CamAdjustZ);
}

void drawStartScreen() {
  drawBackground();
  loadColours();
  BoxesOne = fillArray(colours, 1);
  BoxesTwo = fillArray(colours, 2);
  camera(width / 2, height / 2, width / 2.07, width / 2, height / 2, 0, CamAdjustX, CamAdjustY, CamAdjustZ);
  
  for (int i = 0; i < 9; i++) {
   ColorBox box = BoxesOne.get(i);
   box.drawBox();
  }
  
  for (int i = 0; i < 9; i++) {
   ColorBox box = BoxesTwo.get(i);
   box.drawBox();
  }

  if (millis() > 4250) {
  textSize(width / 32);
  textAlign(CENTER);
  fill(255);
  text("Player One Controls:", width / 4, height / 10);
  textSize(width / 42.6666666667);
  text("Q = Fire Cannon", width / 4, 2 * height / 10);
  text("W = Fire Laser", width / 4, 3 * height / 10);
  text("E = Activate Shield", width / 4, 4 * height / 10);
  
  textSize(width / 32);
  text("Player Two Controls:", width - width / 4, height / 10);
  textSize(width / 64);
  text("(On NumPad)", width - width / 4, 1.5 * height / 10);
  textAlign(CENTER);
  textSize(width / 42.6666666667);
  text("1 = Fire Cannon", width - width / 4, 2 * height / 10);
  text("2 = Fire Laser", width - width / 4, 3 * height / 10);
  text("3 = Activate Shield", width - width / 4, 4 * height / 10);
  
  textSize(width / 21.3333333333);
  text("Other Controls:", width / 2, height / 1.5);
  textSize(width / 32);
  text("B = Stop / Start Background Animation", width / 2, height / 1.3);
  text("N = Restart Game, Once Current Game Has Ended", width / 2, height / 1.2);
  text("Press Any Button To Continue To Game", width / 2, height * 0.9);
  
  textSize(width / 48);
  text("Select Your Colours From The Boxes", width / 2, height / 2);
  }
}

void loadColours() {
  colours[0] = color(255, 0, 0);
  colours[1] = color(0, 255, 0);
  colours[2] = color(0, 0, 255);
  colours[3] = color(255, 255, 0);
  colours[4] = color(0, 255, 255);
  colours[5] = color(255, 0, 255);
  colours[6] = color(255, 127.5, 0);
  colours[7] = color(127.5, 0, 255);
  colours[8] = color(255, 0, 127.5);
}

ArrayList<ColorBox> fillArray(color[] colours, int player) {
  ArrayList<ColorBox> boxes = new ArrayList<ColorBox>();
  int row = 0;
  int col = 0;
 for (int i = 0; i < 9; i++) {
   if (player == 1) {
     boxes.add(new ColorBox(col * width / 30 + width / 8, row * width / 30 + height / 2.1, colours[i], player));
   }
   else {
     boxes.add(new ColorBox(col * -width / 30 + width / 1.2, row * width / 30 + height / 2.1, colours[i], player));
   }
     row++;
     if (row > 2) {
      row = 0;
      col++;
     }
 }
  return boxes;
}

void drawLoadScreen() {
  pushMatrix();
  translate(CamFocusX, CamFocusY, CamFocusZ);
  fill(0);
  rect(0, 0, width, height);
  textSize(width / 19.2);
  textAlign(CENTER);
  fill(255);
  text("Loading Game...", width / 2, height / 2);
  popMatrix();
  
  /* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
           /*  Background Variables */
  ImageCount = 0;     MaxImages = 27;    DrawBackgroundFlash = true;
  loadImages();
}

void loadImages() {
  for (int i = 0; i < MaxImages; i++) {
    PImage image = loadImage("Stars" + i + ".png");
    image.resize(width, height);
    Images.add(image); 
  }
}

void loadShapes() {
    /* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
                 /** Shapes and Such **/
  ShipOne = loadShape("ShipOne" + FileType);            ShipThrust = loadShape("ShipThrust" + FileType);
  
  BulletInner = loadShape("BulletInner" + FileType);  BulletOuter = loadShape("BulletOuter" + FileType);
  
  Laser = loadShape("Laser" + FileType);          LaserShield = loadShape("LaserShield" + FileType);
  
  Explosion = loadShape("Explosion" + FileType);  Death = loadShape("DeathOne" + FileType);
    
  ShipOneFill = loadShape("ShipOneFill" + FileType);    LaserTrailShield = loadShape("LaserTrailShield" + FileType);
  
  BulletTrail = loadShape("BulletTrail" + FileType);    BulletFireExplosion = loadShape("BulletFire" + FileType);
  
  ShieldOne = loadShape("ShieldOne" + FileType);        ShieldTwo = loadShape("ShieldTwo" + FileType);
  
  LaserTrail = loadShape("LaserTrail" + FileType);      ShipThrust2 = loadShape("ShipThrustTwo" + FileType);
  
  ShipTwo = loadShape("ShipTwo" + FileType);            ShipTwoFill = loadShape("ShipTwoFill" + FileType);
  
              /** UI Shapes **/
  Screen = loadShape("Screen" + FileType);              Box = loadShape("Box" + FileType);
  Cylinder = loadShape("Cylinder" + FileType); 
  
  styleShapes();
}