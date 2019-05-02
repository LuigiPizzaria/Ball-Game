//Saving and Storing Data to score.txt
// use it like;
// Io io;
// io=new IO();
// io.getHighScore();

public class IO
{
   public void getHighScore()
   {
     String[] lines = loadStrings("score.txt");
    for (int i = 0 ; i < lines.length; i++) {
    GameInformation.highScore=int(lines[i]);
     }

   }
   public void setHighScore()
   {
     String _sPoint = str(GameInformation.highScore);
     String[] list = split(_sPoint, ' ');
     // Writes the strings to a file, each on a separate line
    saveStrings("score.txt",list);
   }
}
