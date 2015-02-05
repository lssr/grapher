import processing.serial.*;
 
 Serial myPort;             // The serial port
 color[] palette = {#1f77b4,
                    #aec7e8,
                    #ff7f0e,
                    #ffbb78,
                    #2ca02c,
                    #98df8a,
                    #d62728,
                    #ff9896,
                    #9467bd,
                    #c5b0d5,
                    #8c564b,
                    #c49c94,
                    #e377c2,
                    #f7b6d2,
                    #7f7f7f,
                    #c7c7c7,
                    #bcbd22,
                    #dbdb8d,
                    #17becf,
                    #9edae5};
 int xPos = 50;             // horizontal position of the graph
 float[] analogVal = new float[6];
 float[] previousAnalogVal = {0,0,0,0,0,0};     
 float[] digitalVal = new float[12];    
 int divider = 10;          // height of divider between analog and digital graphs
 float rowHeight;           // height of row 
 
 void setup () {
   size(1000, 800);
   smooth();
   frame.setResizable(true);
   myPort = new Serial(this, Serial.list()[5], 9600);
   myPort.bufferUntil('\n');
   background(244, 244, 244);
 }
 
 void draw () {
 // everything happens in the serialEvent()
 }
 
 void serialEvent (Serial myPort) {
   
   // Divide window height in 10 rows for analog value and 1 row for digital values
   rowHeight = (height - divider)/(11);

   // get the ASCII string:
   String inString = myPort.readStringUntil('\n');
   
   if (inString != null) {
     
     drawGrid();
     
     // trim off any whitespace:
     inString = trim(inString);
     
     // Separate inString into string values
     String[] vals = split(inString, ';');
     
     if (vals.length == 18) { // Avoid spikes when arduino is connected
     
       for (int i = 0; i < 6; i++) {
         analogVal[i] = map(float(vals[i]), 0, 1023, 0, 10 * rowHeight);
         analogGraph(analogVal[i], previousAnalogVal[i], xPos, palette[i]);
         previousAnalogVal[i] = analogVal[i];
       }
       
       
       for (int j = 6; j < vals.length; j++) {
         digitalVal[j-6] = map(float(vals[j]), 0, 1, 0, rowHeight);
         digitalGraph(digitalVal[j-6], xPos, palette[j]);
       }
       
       // at the edge of the screen, go back to the beginning:
       if (xPos >= width) {
         xPos = 50;
         background(244, 244, 244);
       } 
       else {
         // increment the horizontal position:
         xPos++;
       }
     
     }
     
   }
   
 }
