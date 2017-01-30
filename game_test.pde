// TOTAL LINES (including this comment): 205

import processing.sound.*;

// SETUP
int boardW = 10;
int boardH = 12;
int bloxPixelSize = 39;
int frameRate = 3;
int colors = 4;

int _score = 0;

Board board = new Board(boardW, boardH);
Trump trump = new Trump(830, 580);

Cursor player = new Cursor(0,0);

PImage bg = new PImage();
SoundFile file;

void setup() {
  size(640, 480);
  frameRate(30);
  
  bg = loadImage("bg.png");
  file = new SoundFile(this, "usa.mp3");
  file.play();
  
  generateBlocks();
  
}

int tempPosition = 0;

boolean clickDown = false;
int frame = 0;
void draw() {
  
  background(255);
  image(bg, 0, 0);
  trump.draw();
 
  drawBlocks();
  player.draw();

  if (clickDown) {
    int xIndex = mouseX / bloxPixelSize;
    int yIndex = mouseY / bloxPixelSize;
    removeBlocks(xIndex, yIndex);
  }

  
frame++;}


void clearBlocks() {
  for (int col = boardH-1; col > 0; col--) {
    for (int row = boardW-1; row > 0; row--) {
        if (board.model[row][col] == -1) {
         if (col-1 >= 0) {
           board.model[row][col] = board.model[row][col-1];
           board.model[row][col-1] = -1;
         }
      }
    } 
  }
}

void generateBlocks() {
  for (int col = 0; col < boardH; col++) {
    for (int row = 0; row < boardW; row++) {
       int val = int(random(colors));
       board.model[row][col] = val;
    }
  }  
}

void drawBlocks() {
  for (int col = 0; col < boardH; col++) {
    for (int row = 0; row < boardW; row++) {
       Block block = new Block(row, col, board.model[row][col]);
       block.draw();
    }
  } 
}

void removeBlocks(int x, int y) {
    int totalWidth = boardW*bloxPixelSize;
    int totalHeight = boardH*bloxPixelSize;
    
    if (x < totalWidth && y < totalHeight) {
      int xIndex = x;
      int yIndex = y;
      int selectedValue = board.model[xIndex][yIndex];

      int bonus = 0;
      if (xIndex < 7 && xIndex > 0) {
        if (selectedValue == board.model[xIndex+1][yIndex]) {
          board.model[xIndex+1][yIndex] = -1;
          _score++;
        }
      }
      if (xIndex > 0) {
        if (selectedValue == board.model[xIndex-1][yIndex]) {
          board.model[xIndex-1][yIndex] = -1;
          _score++;
        }  
      }

      if (yIndex < 7) {
        if (selectedValue == board.model[xIndex][yIndex+1]) {
          board.model[xIndex][yIndex+1] = -1;
          _score++;
        }
      }
      if (yIndex > 0) {
        if (selectedValue == board.model[xIndex][yIndex-1]) {
          board.model[xIndex][yIndex-1] = -1;
          _score++;
        }
      }
      board.model[xIndex][yIndex] = -1;
      _score++;

      boolean finish = false;
      while (!finish) {
        for (int col = boardH-1; col > 0; col--) {
          for (int row = boardW-1; row > 0; row--) {
            if (board.model[row][col] == -1) {
              if (board.model[row][col-1] != -1) {
                // There's an empty space with a block above it
                finish = false;
                clearBlocks();
              } else {
                finish = true; 
              }              
            }
          }
        }
      }
    }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      player.moveY(-1);
    }
    if (keyCode == DOWN) {
      player.moveY(1);
    }
    if (keyCode == LEFT) {
      player.moveX(-1);
    } 
    if (keyCode == RIGHT) {
      player.moveX(1);
    } 
    if (keyCode == SHIFT) {
      removeBlocks(player.xIndex, player.yIndex);
      print("Score: "+_score+"\n");
    }
  }
}