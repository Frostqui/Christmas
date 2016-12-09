part of santaclaus;

class Santa extends Bitmap implements Animatable {

  num _vx, _vy;
  bool movingLeft = false;
  bool movingRight = false;
  bool movingUp = false;
  bool movingDown = false;
  var resourceManager = new ResourceManager();
  num y_pos,x_pos;

  var resource_route = "img/";



  Santa(BitmapData bitmapData,this._vx,this._vy) : super(bitmapData) {
    pivotX = bitmapData.width / 2;
    pivotY = bitmapData.height / 2;
    x = 700;
    y = 700;
    y_pos = y;

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
    y_pos = y;
    return true;
  }

void loadResources() async{

  resourceManager.addBitmapData("santa", resource_route+"santa.png");
  resourceManager.addBitmapData("snow", resource_route+"snow.png");
  resourceManager.addBitmapData("santa-left", resource_route+"santa-left.png");
  resourceManager.addBitmapData("santa-right", resource_route+"santa-right.png");
  resourceManager.addBitmapData("santa-top", resource_route+"santa-top.png");

  await resourceManager.load();


}


}