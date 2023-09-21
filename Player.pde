public class Player
{
  private String playerName;

  public Player(String playerName)      //A short String class to allow to player to enter their username
  {
    if ((playerName.length() > 0) && (playerName.length() <= 10))      //Making it manditory for the user to enter a name
    {
      this.playerName = playerName;
    } else
    {
      this.playerName = playerName.substring(0, 10);
    }
  }

  public String getPlayerName()
  {
    return playerName;
  }

  public void setPlayerName(String playerName)
  {
    this.playerName = playerName.substring(0, 10);
  }
  public String toString()      //Storing the playerName data so it can be called later
  {
    String str = playerName;
    return str;
  }
}
