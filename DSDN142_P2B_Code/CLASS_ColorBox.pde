class ColorBox {
  color col;
  float x, y;
  float size;
  int player;
  
  ColorBox(float X, float Y, color C, int P) {
   x = X;
   y = Y;
   col = C;
   size = width / 30;
  }
  
  void drawBox() {
    rectMode(CORNER);
   fill(col);
   rect(x, y, size, size);
   //pushMatrix();
   //translate(x, y);
   //box(size);
   //popMatrix();
  }
  
  boolean detectClick(int X, int Y) {
   if (X >= x && X <= x + size && Y >= y && Y <= y + size) {
     return true;
   }
   return false;
  }
  
  color getCol() {
    return col;
  }
  
  float getX() {
    return x;
  }
  
  float getY() {
   return y; 
  }
  
  int getPlayer() {
   return player; 
  }

}