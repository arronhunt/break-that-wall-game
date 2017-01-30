class Cursor {
  int xIndex, yIndex;
  
  Cursor(int x, int y) {
    this.xIndex = x;
    this.yIndex = y;
  }
  
  void draw() {
      pushMatrix();
      stroke(0, 0, 0);
      strokeWeight(3);
      noFill();
      rect(xIndex * bloxPixelSize, yIndex * bloxPixelSize, bloxPixelSize, bloxPixelSize);
      popMatrix();
  }
  
  int[] indexPath() {
    int[] array = new int[2];
    array[0] = this.xIndex;
    array[1] = this.yIndex;
    
    return array;
  }
  
  void moveX(int x) {
    if (xIndex > -1) {
      this.xIndex += x;
    }
  }
  void moveY(int y) {
    this.yIndex += y; 
  }
  
}