IO io;
Ball ball;
  static float _boxPosX=300f; //horizontal start pkt
  static  float _boxPosY=550f;//vertikal start pkt
static int _boxLenght=70; //lange
 int _boxHeight=15; //hohe
private float _boxSpeed=5f; //private weil ich speed hier mache
int _maxBox=3; //variable fur wie viel boxen spawnen konnen
ArrayList <Box> _boxes = new ArrayList <Box>(); // list of boxes  

final int WAIT_TIME = (int) (3.5 * 1000); // 3.5 seconds
int startTime;

void setup()
{
GameInformation.gameStatus=GameInformation.GameStatus.MENU;
 io= new IO(); //
 io.getHighScore();
  size(600,600); //size window
   noStroke(); //borders of objects  
   frameRate(30);
   ellipseMode(RADIUS);
   ball = new Ball(499,300,7f,3.8f,3f); 
     fill(#FAC0C0);

 
  //fill(0, 102, 153);

}
void draw()
{  
  if(GameInformation.gameStatus==GameInformation.GameStatus.MENU)
  {
    InMenu();
  }
  else if(GameInformation.gameStatus==GameInformation.GameStatus.INGAME)
  {
    InGame();
  }
  else if(GameInformation.gameStatus==GameInformation.GameStatus.GAMEOVER)
  {
     GameOver();
  }
  else
  {
    //Throw Error. Or do nothing.
  }
  

  
  
  
 
}
void keyPressed()
{
  // if its in menu state, ingame state etc....
  
    if(GameInformation.gameStatus==GameInformation.GameStatus.MENU)
  {
     if(key=='X' || key=='x')
  {
    GameInformation.gameStatus=GameInformation.GameStatus.INGAME;
  }
  else if(key=='E' || key=='e')
  {
    exit();
  }
  }
  else if(GameInformation.gameStatus==GameInformation.GameStatus.INGAME)
  {
     
  if(_boxPosX<=0)
  {
    //do nothing
  }
  else
  {
  if(key=='A' || key=='a')
  {
    _boxPosX-=1*_boxSpeed;
  }
  }
    if(_boxPosX>=width-_boxLenght)
    {
      //do nothing
    }
    else
    {
  if(key=='D'|| key=='d')
  {
  _boxPosX+=1*_boxSpeed;
  }
    }
  }
  else if(GameInformation.gameStatus==GameInformation.GameStatus.GAMEOVER)
  {
         if(key=='X' || key=='x')
  {
    GameInformation.point=0;
     for (int i = _boxes.size()-1; i >= 0; i--) 
     { 
       _boxes.remove(i);
       
  ball = new Ball(499,300,7f,3.8f,3f);
    GameInformation.gameStatus=GameInformation.GameStatus.INGAME;
  }
  }  
  else if(key=='E' || key=='e')
  {
    exit();
  }
  }
  else
  {
    //Throw Error. Or do nothing.
  }
  
  

 
}



/// Those are the States.
private void InGame()
{
   
  float spawnX=300;
  float spawnY=300;
  background(102);
 textSize(15);
 text("HighScore:", 10, 20); 
  text(GameInformation.highScore,110, 20); 
   text("Current Point:", 10, 40); 
  text(GameInformation.point,110, 40); 
  rect(_boxPosX,_boxPosY,_boxLenght,_boxHeight);
  ball.Move();
  ball.CheckPos();
  ball.Update();
  
  
  //CHEKING ALL THE BOXES,
    for (int i = _boxes.size()-1; i >= 0; i--) { 
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Box box = _boxes.get(i);    
        box.BDraw();
       
             if(box._boxPosX>0)
       {
       // Cheking the current pos. Boxes and hope for the best for the spawn.
      spawnX =random(box._boxLenght+box._boxPosX-random(0,10),width-box._boxLenght);
           spawnY =random(box._boxHeight+10,400);
         if(spawnX>=width-box._boxLenght)
         {
             spawnX =random(box._boxLenght,width-box._boxLenght);
         }
         if(spawnX<=box._boxLenght)
         {
             spawnX =random(box._boxLenght,width-box._boxLenght);
         }
       }
       else
       {
      spawnX =random(box._boxLenght,width-box._boxLenght+random(0,10));
           spawnY =random(box._boxHeight+10,400);
       }
         
       if(CollisionChecker.Check(ball._ballCoorX,ball._ballCoorY,ball._ballRad,box._boxPosX,box._boxPosY,box._boxLenght,box._boxHeight))
    {
      ball. _ballDirectionY*=-1;
      box._hitPoint--;
      if(box._hitPoint<=0)
      {
        if(box._awsome)
        {
          GameInformation.point+=2;
        }
        else
        {
        GameInformation.point++;
        }
           _boxes.remove(i);
       // destroy;
       //give ball rotation
      }
      // _ballDirectionY*=-1;
       //give random values. (speed)
    }

    

  } 
        if (hasFinished()) {
     if(_boxes.size()<_maxBox) //check if there is less box then maxbox, then spawn new ones. else do nothing
     {
 //spawn new box
  
      if(GameInformation.point>=10)
        _boxes.add(new Box(spawnX, spawnY, 79,10,true));
        else
            _boxes.add(new Box(spawnX, spawnY, 79,10,false));
     }
    startTime = millis();
  }
  
}

private void InMenu()
{
  background(102);
  textSize(15);
 text("HighScore:", 10, 20); 
  text(GameInformation.highScore,110, 20); 
   text("Current Point:", 10, 40); 
  text(GameInformation.point,110, 40); 
  
   textSize(30);
   text("MENU", 300, 200); 
   textSize(15);
    text("for Play Please Press X", 300, 400); 
    text("for Exit Please Press E", 300, 500); 
  
}

private void GameOver()
{

  if(GameInformation.point>GameInformation.highScore)
  {
    int oldScore=GameInformation.highScore;
    //HighScore Broken!
    GameInformation.highScore=GameInformation.point;
    io.setHighScore();
    text("Old High Score:", 10, 60); 
    text(oldScore,110, 60); 
  }
    background(102);
  textSize(15);
 text("HighScore:", 10, 20); 
  text(GameInformation.highScore,110, 20); 
   text("Current Point:", 10, 40); 
  text(GameInformation.point,110, 40); 
  
   textSize(30);
   text("Game Over", 300, 200); 
   textSize(15);
    text("for Play Please Press X", 300, 400); 
    text("for Exit Please Press E", 300, 500); 
}

//Check timer to spawn a new one
  boolean hasFinished() {
  return millis() - startTime > WAIT_TIME;
}