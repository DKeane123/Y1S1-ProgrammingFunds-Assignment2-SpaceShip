public class Ship
{
  private int xCoord;          //X coordinate of the ship
  private int yCoord;          //Y coordinate of the ship
  private int shipWidth;       //width of the ship
  private int shipHeight;      //height of the ship

  public Ship(int shipWidth, int shipHeight)      //Constructor to create the ship
  {
    setShipWidth(shipWidth);
    setShipHeight(shipHeight);
    xCoord = 0;      //Setting a stand-in value for the X coordinate
    yCoord = 400;    //Hard coding the y value as it does not need to change
  }

  public void update()      //Updates the position of the ship
  {
    xCoord = mouseX - shipWidth/2;      //Makes the ship follow the mouse

    if (xCoord - shipWidth/2 < 0)      //Stops the ship going off the left side of the screen
    {
      xCoord = 0 + shipWidth/2;
    }
    if (xCoord > (width + shipWidth/2))      //Stops the ship going off the right side of the screen
    {
      xCoord = width - shipWidth/2;
    }
  }

  public void display()
  {
    ellipse(xCoord, yCoord, shipWidth, shipHeight);      //An ellipse to act as a back-up model if the spaceship image fails to load
    image(spaceship, xCoord-45, yCoord -60);             //Drawing the picture of the spaceship
  }

  //getters//
  public int getXCoord()
  {
    return xCoord;
  }

  public int getYCoord()
  {
    return yCoord;
  }

  public int getShipWidth()
  {
    return shipWidth;
  }

  public int getShipHeight()
  {
    return shipHeight;
  }

  //setters//
  public void setShipWidth(int shipWidth)      //The ship width must be between 10 and 50 pixels. If it isnt it defaults to 30 pixels
  {
    if ((shipWidth >= 10) && (shipWidth <= 50))
    {
      this.shipWidth = shipWidth;
    } else
    {
      this.shipWidth = 30;
    }
  }

  public void setShipHeight(int shipHeight)      //The ship height must be between 50 and 100 pixels. If it isnt it defaults to 75 pixels
  {
    if ((shipHeight >= 50) && (shipHeight <= 100))
    {
      this.shipHeight = shipHeight;
    } else
    {
      this.shipHeight = 75;
    }
  }
}
