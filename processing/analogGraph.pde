// Define the analogGraph() function
// Draws the analog values

void analogGraph(float val, float prev, int xPos, color col) {     
     noStroke();
     fill(col, 80);
     int d = 7;
     ellipse(xPos, height - val - divider - rowHeight, d, d);
     
     stroke(col, 90);
     strokeWeight(5);
     line(xPos - 1, height - prev - divider - rowHeight, xPos, height - val - divider - rowHeight);
}
