
public class Obsticle
{
  private float xCoord;      //X coordinate of the obsticle
  private float yCoord;      //Y coordinate of the obsticle
  private float lengthX;     //Length along the x-axis
  private float lengthY;     //Length along the y-axis
  private float gravity;     //Variable that causes obsticles to fall

  public Obsticle(int lengthX, int lengthY)      //Constructor to create the obsticle
  {
    setLengthX(lengthX);
    setLengthY(lengthY);
    newObsticle();      //Method to create a new obsticle when it reaches the bottom
  }

  public void update()      //Changes the obsticles position and resets it if it goes off the screen
  {
    if (yCoord > height)
    {
      newObsticle();
      score++;
    } else 
    {
      yCoord = yCoord + gravity;
    }
  }

  public void display()      //Draws the obsticles on the screen
  {
    fill(255);
    noStroke();
    rect(xCoord, yCoord, -lengthX, -lengthY);
  }

  //getters//
  public float getXCoord()
  {
    return xCoord;
  }

  public float getYCoord()
  {
    return yCoord;
  }

  public float getLengthX()
  {
    return lengthX;
  }

  public float getLengthY()
  {
    return lengthY;
  }

  public float getGravity()
  {
    return gravity;
  }

  //setters//
  public void setLengthY(float lengthY)     //The ship width must be between 10 and 50 pixels.
  {
    this.lengthY = random(25, 50);
  }

  public void setLengthX(float lengthX)      //The obsticle lenght along the x-axis must be between 50 and 125 pixels.
  {
    this.lengthX = random(50, 125);
  }


  //private helpers
  private void newObsticle()      //Tells the program how to reset the obsticles
  {
    xCoord = random(width - lengthX);
    yCoord = -100;
    gravity = 5;
  }
}
