part of santaclaus;

class Santa extends Bitmap implements Animatable {

  num _vx, _vy;
  bool movingLeft = false;
  bool movingRight = false;
  bool movingUp = false;
  bool movingDown = false;
  var resourceManager = new ResourceManager();



  Santa(BitmapData bitmapData,this._vx,this._vy) : super(bitmapData) {
    pivotX = bitmapData.width / 2;
    pivotY = bitmapData.height / 2;
    x = 700;
    y = 700;
    loadResources();
  }



  bool advanceTime(num time){

    if(movingLeft){
      bitmapData = resourceManager.getBitmapData("santa-left");
      if(santa.x>70) {

        x = x - _vx * time;
      }
    }else if(movingRight){
      x = x + _vx * time;
      bitmapData=resourceManager.getBitmapData("santa-right");
    }
    if(movingUp){
      if(santa.y > 90) {
        y = y - _vy * time;
      }
      bitmapData=resourceManager.getBitmapData("santa-top");
    }else if(movingDown){
      y = y + _vy * time;
      bitmapData=resourceManager.getBitmapData("santa");
    }
    return true;
  }

void loadResources() async{

  resourceManager.addBitmapData("santa", "santa.png");
  resourceManager.addBitmapData("snow", "snow.png");
  resourceManager.addBitmapData("santa-left", "santa-left.png");
  resourceManager.addBitmapData("santa-right", "santa-right.png");
  resourceManager.addBitmapData("santa-top", "santa-top.png");

  await resourceManager.load();


}


}