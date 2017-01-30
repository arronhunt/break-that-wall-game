int size = bloxPixelSize;

class Block {
  int flag;
  int x, y;
  
  Block(int x, int y, int value) {
    this.x = x;
    this.y = y;
    this.flag = value;
  }
  
  void draw() {
    PImage img = new PImage();
    
    switch (this.flag) {
       case 0:
         img = loadImage("brickA.png");
         break;
       case 1:
         img = loadImage("brickB.png");
         break;
       case 2:
         img = loadImage("brickC.png");
         break;
       case 3: 
         img = loadImage("brickD.png");
         break;
       default:
         img = loadImage("brickE.png");
         break;
     }
     
     image(img, this.x * size, this.y * size);
  }
}