void drawGrid() {
  
  // Draw divider between analog and digital
  noStroke();
  fill(#DCDCDC);
  rect(0, height - rowHeight - 10, width, 10);
  
  // Draw horizontal lines accross the window and add label
  for (int i = 1; i<=10; i++) {
    textSize(12);
    stroke(#DCDCDC, 80);
    strokeWeight(1);
    line(50, height - rowHeight - 10 - i * rowHeight, width, height - rowHeight - 10 - i * rowHeight);
    textAlign(RIGHT, CENTER);
    fill(#000000, 100);
    text((1023/10) * i, 45,height - rowHeight - 10 - i * rowHeight);
  }
  
  text("Digital", 45, height - rowHeight/2);
  
  for (int k = 0; k<=18; k++) {
    
    fill(palette[k]);
    textSize(height*0.025);
    String label = (k>6) ? ("Digital " + (k-5)) : ("Analog " + k);  
    text(label, width - 10, (height*0.03)*k+30);
  }
  
  
  
  
}
