//creating the box.
//those are the spawnable boxes
//not the contralbe
class Box
{
  float _boxPosX;
  float _boxPosY;
  int _boxLenght;
  int _boxHeight;
  boolean _awsome =false;
  byte _hitPoint=1;
  //boolean _isReadyToDie=false;
  //Types _type;
    //Constructor #2 Custom value
  Box(float x,float y,int l ,int h,boolean a)
  {
    _boxPosX=x;
    _boxPosY=y;
    _boxLenght=l;
    _boxHeight=h;
    _awsome=a;
    if(_awsome)
    {
      _hitPoint=2;
      _boxLenght*=2;
      _boxHeight*=2;
    }
  }
 /* 
  void CheckPos(float ballX,float ballY)
  {
    if(CollisionChecker.Check(ballX,ballY,_boxPosX,_boxPosY,_boxHeight,_boxLenght))
    {
      _hitPoint--;
      if(_hitPoint<=0)
      {
        _isReadyToDie=true;
       // destroy;
       //give ball rotation
      }
      // _ballDirectionY*=-1;
       //give random values. (speed)
    }

    
  }*/
 //drawing the boxes
   void BDraw()
  {
   rect(_boxPosX,_boxPosY,_boxLenght,_boxHeight);
  }

} 
