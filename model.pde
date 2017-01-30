class Board {
  int cols, rows;  
  int[][] model;
  
  Board(int cols, int rows) {
    
    this.cols = cols;
    this.rows = rows;
    this.model = new int[this.cols][this.rows];
    
    for (int x = 0; x < cols; x++) {
      for (int y = 0; y < rows; y++) {
        model[x][y] = 0;
      }
    }
  }
  
}