class Trump {
  int posX, posY;
  int frames = 4;
  int frameRate = 8;
  
  Trump(int x, int y) {
    this.posX = x;
    this.posY = y;
  }
  
  int currentFrame = 0;
  void draw() {
    PImage img = new PImage();
    switch(currentFrame % frames) {
      case 0:
        img = loadImage("trump_1.png");
        break;
      case 1:
        img = loadImage("trump_2.png");
        break;
      case 2:
        img = loadImage("trump_3.png");
        break;
      case 3:
        img = loadImage("trump_2.png");
        break;
    }
    
    if (frame % frameRate == 0) {
      this.currentFrame++;
    }

    pushMatrix();
    scale(0.5);
    image(img, this.posX, this.posY);
    popMatrix();
    
  }
}