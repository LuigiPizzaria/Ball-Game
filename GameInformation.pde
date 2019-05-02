//Static methode
//Those are the main variablen.
// use it like;
// GameInformation.point=3; etc...
 
 public static class GameInformation 
 {
  public static int point=0;
  public static int highScore=0;
  public enum GameStatus //Variable Type
  {
   MENU, 
   INGAME,
   GAMEOVER
  };
  public static GameStatus gameStatus=GameStatus.MENU;
 }
 


 
