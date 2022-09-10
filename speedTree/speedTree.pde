//--------------------------------------------------------------------------------------------------//
// Program made by Spocxy/Luc van Dijk. thank you for downloading the project. Thanks to my
// lecturers and classmates for gives me cool ideas and helping me out bits here and there
// code is free to copy if you don't find it crappy enough lmao 
// feel free to try and improve the code.
//--------------------------------------------------------------------------------------------------//

//program to keep it seperated from main
Program p;

//global time variable for certain sin functions
float time;

void setup()
{
  //set up a window with color mode
  size(1280, 720);
  background(0);
  colorMode(HSB);
  
  //initialize the program
  p = new Program();
}

void draw()
{
  //increase arbitrary time variable
  time += 0.01;
  
  //draw a rectangle instead of clearing the screen for a fade type effect
  noStroke();
  //fill(0,0,0,12.75); //lot's of fading
  fill(0, 0, 0, 31.875); //some fading
  rect(0, 0, width, height);
  
  //update and show the program
  p.Update();
  p.Show();
}
