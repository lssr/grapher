// Define the digitalGraph() function
// Draws the digital values

void digitalGraph(float val, int xPos, color col) {
  stroke(col, 80);
  line(xPos, height, xPos, height - val);
}
