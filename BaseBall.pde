//baseball class,
//

class Ball
{
   float _ballCoorX,_ballCoorY,_ballRad;
  
  
  float _ballSpeedX;
  float _ballSpeedY;
  
  int _ballDirectionX=1;
  int _ballDirectionY=1;
  //Constructor 
   Ball()
  {
    _ballCoorX=300f;
    _ballCoorY=300f;
    _ballRad=8f;
    _ballSpeedX=3.8f;
    _ballSpeedY=3.1f;
   
  }
  Ball(float x, float y, float r, float sx, float sy)
  {
    _ballCoorX=x;
    _ballCoorY=y;
    _ballRad=r;
    _ballSpeedX=sx;
    _ballSpeedY=sy;
 
  }
  //move!!!!
  void Move()
  {
   _ballCoorX = _ballCoorX + ( _ballSpeedX * _ballDirectionX ); //Horizontal
   _ballCoorY = _ballCoorY + ( _ballSpeedY * _ballDirectionY ); //Vertical
  }
  
  //checking the Collision.
  void CheckPos()
  {
  /*  if(_ballCoorY<Main._boxPosY && _ballCoorY>Main._boxPosY-Main._boxHeight)
    {
      if(_ballCoorX>Main._boxPosX && _ballCoorX<_boxPosX+_boxLenght)
      {
      
          _ballDirectionY*=-1;
      }
    }*/
    
    if(CollisionChecker.Check(_ballCoorX,_ballCoorY,_ballRad,Main._boxPosX,Main._boxPosY,_boxLenght,_boxHeight))
    { 
      _ballDirectionY*=-1;
       
       //give random values. (speed)
    }
    if((_ballCoorX>width-_ballRad) || (_ballCoorX<_ballRad))
    {
       _ballDirectionX*=-1;
    }
      if((_ballCoorY>height-_ballRad) || (_ballCoorY<_ballRad))
    {
      _ballDirectionY*=-1;
    }
    if(_ballCoorY>Main._boxPosY+_ballRad)
    {
      GameInformation.gameStatus=GameInformation.GameStatus.GAMEOVER;
    
    }
  }
 //updating the current pos.
   void Update()
  {
   ellipse(_ballCoorX,_ballCoorY,_ballRad,_ballRad);
  }

 // boolean isCollided()
 // {
  //  if()
   // {
   // return true;
  //  }
  //  return false;
//  }

}