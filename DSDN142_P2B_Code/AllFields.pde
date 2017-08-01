/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
                /* Co-Ords Variables */
float X, Y, Z;  //Variables for x y and z co-ords
float X1, Y1, Z1;  //Variables for x y and z co-ords for ship one
float X2, Y2, Z2;  //Variables for x y and z co-ords for ship one



/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
           /* Translate and Rotate Variables */
float AngleX, AngleY, AngleZ;


/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
           /*  Background Variables */
int ImageCount;  //Counts the index of the current image
ArrayList<PImage> Images = new ArrayList<PImage>();  //An array list for all the images
int MaxImages;   //The max number of images to load
boolean DrawBackgroundFlash;  //A boolean for whether or not the background will flash

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
              /* Camera Variables */
float CameraX, CameraY, CameraZ;  //X, Y, Z camera values
float CamFocusX, CamFocusY, CamFocusZ;  //Camera focus point values
int CamAdjustX, CamAdjustY, CamAdjustZ; //Camera adjustment variables



/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
         /* Menu Variables */
boolean MenuUp;
ArrayList<ColorBox> BoxesOne, BoxesTwo;
color[] colours = new color[9];




/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
         /* Game Function Variables */
         
  /** HP Variables **/
    float HPOneInitial, HPTwoInitial;  //Base HP values for each ship
    float HPOne, HPTwo; //HP values for the two ships
    float HPOneShield, HPTwoShield; //The health values of the ships before they were shielded

  /** Damage And Bullet Variables **/
    int BulletDamage, LaserDamage;  //damage values
    int BulletVelo;  //The velocity of the bullet
  
  /** Object Arrays **/
    ArrayList<Bullet> bullets;  //Array list of bullet objects
    ArrayList<Laser> lasers;  //Array list of laser objects
  
  /** Cooldown + Timer Variables **/
    float BulletCooldown, LaserCooldown;  //The cooldown of the weapons
    float BFireOne, BFireTwo, LFireOne, LFireTwo;  //The time when the weapons for each player were last fired
    float BOneLastFire, BTwoLastFire, LOneLastFire, LTwoLastFire;  //The last time the bullet was fired
    float ShieldCooldown, ShieldFireOne, ShieldFireTwo, ShieldOneLastFire, ShieldTwoLastFire;  //The necessary fields for the shields
  
  /** Shield Activity Variables **/
    boolean ShieldOneActive, ShieldTwoActive; //The shields for both ships
  /** Game Over Boolean **/
    boolean GameOver; //A boolean variable to check if the game is over or not



/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
         /* Ship Property Variables */
color PlayOneCol, PlayTwoCol;  //Colour values for the ships and their weapons
float ShipWidth, DistBetweenShips;  //The width of the ships and distance between them



/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
                 /* Shapes and Such */

  /** Ship Related Shapes **/
    PShape ShipOne, ShipOneFill, ShipTwo, ShipTwoFill, ShipThrust, ShipThrust2;  //Ship and thruster output variables
  
  /** Cannon Related Shapes **/
    PShape BulletOuter, BulletInner, BulletTrail;  //By having two seperate bullet objects, I can style each only once, and make the code faster
  
  /** Laser Related Shapes **/
    PShape Laser, LaserShield, LaserTrail, LaserTrailShield;  // Laser objects
  
  /** Shield Related Shapes **/
    PShape ShieldOne, ShieldTwo;  // Shield Objects
    
  /** Explosion and Animation Related Shapes **/
    PShape Explosion, BulletFireExplosion, Death;

  /** UI Related Shapes **/
    PShape Screen;  //The box all the shapes go in, like a screen
    PShape Box;  //A basic box. Used for most of the UI objects.
    PShape Cylinder;  //A cylinder shape, PlayerTwo uses these for a lot of their shapes


/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
                     /* Shape Placement Fields */
  /** Bullet Placement Fields **/
    float BulletOneX, BulletOneY, BulletOneZ;  //These fields dictate where each ships bullet is fired from, for correct placement
    float BulletTwoX, BulletTwoY, BulletTwoZ;
    float BulletAdjustment;  //The distance between the two guns, so the bullts can move between then
    boolean EvenBulletFireOne, EvenBulletFireTwo;  //A boolean to track which gun was fired
  
  /** Laser Placement Fields **/
    float LaserOneX, LaserOneY, LaserOneZ;
    float LaserTwoX, LaserTwoY, LaserTwoZ;
    
  /** Shield Placement Fields **/
    float ShieldOneX, ShieldY, ShieldOneZ;
    float ShieldTwoX, ShieldTwoY, ShieldTwoZ;
    
    

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
                     /* Misc Fields */
  String FileType; //What type of file the shapes are, svg or obj
  boolean Debug;  //If the debug functions and keys are enabled
  PFont Font;  //The font for the sketch
  
