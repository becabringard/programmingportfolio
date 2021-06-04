//Beca Bringard | Computer timeline
//Oct 2020
boolean hover =false;

void setup() {
  size(900,400);
}

void draw() {
  background(128);
  println(hover);
  drawRef();
  histEvent(260,200,80,25,"Bombes(39)","Bombes where designed in 1939 by Bletchley Park and Alan Turing, but refinements where made by Gordon Welchman.\n It was an electro-mechanical device designed to decipher German-enigma-machine encrypted messages during world war 2",true);
  histEvent(355,275,101,25,"Manchester baby(48)","Manchester baby was built in 1948 by Fredric Williams, Tom Kilburn, and Geoff Tootil. \n It was the worlds first electronic stored-program computer and first random-access digital storage device.",false);
  histEvent(375,200,105,25, "Ferranti Mark 1(1951)", "The Ferranti Mark 1 was built in 1951 by Ferranti. It was the first commercial computer. \n It was based off of the Manchester Mark 1. Main improvements over the Manchester 1 were the size of primary storage and a faster multiplier.",true);
  histEvent(458,275,56,25, "MOSFET(59)","MOSFET was invented in 1959 by Mohamed Atalla abd Dawon Kahng. It enabled the practical use of MOS transistors \n as memory cell storage, a function previosuly served by magnetic cores.",false);
  histEvent(485,200,55,25,"Atlas(62)","The Atlas was created in 1962 by Ferrantie and Plessey. It was one of the world's first \n super computers. Considered to be the most povwerful computer in the world at the time.",true);
  histEvent(515,275,105,25,"Control Data Corp.(64)","Designed in 1964 by Seymour Cray. It is a series of computers made to use innovative designs and paraellism to achieve superior computational peak performance.",false);
  histEvent(575,200,80,25,"Intel 4004(71)","Designed by ted hoff, federico faggin, masatoshi shima, and stanley mazor in 1971. The first single-chip mircoprocessor. It was developed on a single PMOS LSL chip.",true);
  histEvent(620,275,50,25,"P6060(75)","Built by Olivetti in 1975. The worlds first pre-assembled personal computer.\n At this time, many do-it-yourself kits were being sold, so this was the first personal computer you could get already made.",false);
}

void drawRef() {
  //Draws the timeline
  strokeWeight (2);
  stroke(50);
  line(100,250,800,250);
  
  //Draws title info.
  textAlign (CENTER);
  textSize(36);
  text("Computer Timeline",width/2,65);
  
  //Descriptive text
  textSize (12);
  text("Beca Bringard | 2020", width/2, 120);
  
  //Descriptive text
  textSize(16);
  textAlign(CENTER);
  text("A timeline that shows some important inventions and ideas that lead up to the modern day computer.", width/2, 95);
}

void histEvent(int x, int y, int w, int h, String title, String description, boolean top) {
  //Detection of the mouseover
  hover = (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h);
  
  //Draw rectangle
  textSize(9);
  textAlign(CENTER);
  strokeWeight (2);
  if(hover == true) {
    fill(255);
    text(description, 450, 350);
  } else {
    fill(255);
  }
  rect(x,y,w,h,5);
  
  //Text overlay
  textAlign (LEFT);
  fill(0);
  text(title,x+5,y+20);
  
  //Connecting line to the timeline
  if(top == true){
    line(x+20,y+25,x+35,y+50);
  } else {
    line(x+20,y,x+35,y-25);
  }
  //Draw tic marks
  strokeWeight(1);
  for (int i=100; i<801; i+=50) {
    line(i, height*0.625-10, i, height*0.625+10);
   
  }
  textSize(10);
  fill(0);
  text("1920", 90, height*0.6-10);
  text("1990", 790, height*0.6-10);
}
