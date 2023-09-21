PImage spaceship;      //importing an image for the spaceship
import javax.swing.*;

int score = 0;         //keeps track of the players points
int amount = 0;        //number of obsticles that will be drawn
int dif = 3;           //variable to set the size of the obsticle array


//Objects required in the program
Obsticle[] obsticle = new Obsticle[dif];
Ship ship;
Player player;

void setup()
{
  spaceship = loadImage("spaceship.png");      //choosing the image
  size(500, 500);
  noCursor();

  for (int amount = 0; amount < dif; amount++) {      //looped array so the player can change the amount of obsticles
    obsticle[amount] = new Obsticle(50, 100);
  }

  ship = new Ship(50, 100);        //Setting up the player controled ship

  player = new Player(JOptionPane.showInputDialog("Enter the player name"));      //Setting the text box for the player to enter a username

  dif = Integer.parseInt(JOptionPane.showInputDialog("Enter Difficulty:", "3"));       //Setting the text box that allows the user to choose a difficulty
}

void draw()
{
  background(0);

  if (dif > 3) {      //Two if statements that stop the player from spawning too many obsticles
    dif = 3;
  }
  if (dif < 1) {
    dif = 1;
  }

  for (int amount = 0; amount < dif; amount++) {      //Functions to draw the obsticles on the screen
    obsticle[amount].update();
    obsticle[amount].display();
  }

  ship.update();      //Functions to draw the ship on the screen
  ship.display();

  if (score == 10) {      //Victory condition, Creates a text box to inform the player
    JOptionPane.showMessageDialog(frame, "Congratulations " + player.toString() + ", You won");
    exit();
  }

  boolean playerHit = gameOver(obsticle[amount], ship);      //Failure condition, Creates a text box to inform the player
  if (playerHit == true)
  {
    JOptionPane.showMessageDialog(frame, "Unlucky " + player.toString() + "\n" + "You scored " + score/dif + " out of 10 points" + "\n" + "Better luck next time");
    exit();
  }
}



boolean gameOver(Obsticle obsticle, Ship ship)      //Calculates if the ship and the obst
{
  float obsticleDistanceX = abs(obsticle.getXCoord() - ship.getXCoord() - ship.getShipWidth()/2);
  float obsticleDistanceY = abs(obsticle.getYCoord() - ship.getYCoord() - ship.getShipHeight()/2);

  if (obsticleDistanceX > (ship.getShipWidth()/2 + obsticle.getLengthX()/2)) {
    return false;
  }  
  if (obsticleDistanceY > (ship.getShipHeight()/2 + obsticle.getLengthY()/2)) {
    return false;
  }

  if (obsticleDistanceX <= (ship.getShipWidth()/2)) {
    return true;
  }  
  if (obsticleDistanceY <= (ship.getShipHeight()/2)) {
    return true;
  }

  float obsticleCorner = pow(obsticleDistanceX - ship.getShipWidth()/2, 2) +
    pow(obsticleDistanceY - ship.getShipHeight()/2, 2);

  if (obsticleCorner <= pow(obsticle.getLengthX()/2, 2))
  {
    return true;
  }
  if (obsticleCorner <= pow(obsticle.getLengthY()/2, 2))
  {
    return true;
  } else
  {
    return false;
  }
}
