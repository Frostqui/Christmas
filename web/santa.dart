part of santaclaus;

class Santa extends Bitmap implements Animatable {


  Shadoow shadoow;
  num _vx, _vy;
  bool movingLeft = false;
  bool movingRight = false;
  bool movingUp = false;
  bool movingDown = false;
  var resourceManager;
  num y_pos,x_pos;




  num time = 25;


  var resource_route = "img/";



  Santa(BitmapData bitmapData,this._vx,this._vy) : super(bitmapData) {

    name = "santa";

    resourceManager = new ResourceManager();
    pivotX = bitmapData.width / 2;
    pivotY = bitmapData.height / 2;
    x = 700;
    y = 700;
    y_pos = y;

    loadResources();


    //shadoow.setX(santa.x + 30);
    //shadoow.y = (santa.y + bitmapData.height)-30;


  }



  bool advanceTime(num time){


    //shadoow.setX(santa.x + 30);


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

      changeSprite(resourceManager.getBitmapData("santa"),resourceManager.getBitmapData("santa2"));

      y = y + _vy * time;
      //bitmapData=resourceManager.getBitmapData("santa");
    }
    y_pos = y;
    return true;
  }

void loadResources() async{

  resourceManager.addBitmapData("santa", resource_route+"santa1.png");
  resourceManager.addBitmapData("santa2", resource_route+"santa2.png");
  resourceManager.addBitmapData("snow", resource_route+"snow.png");
  resourceManager.addBitmapData("santa-left", resource_route+"santa-left.png");
  resourceManager.addBitmapData("santa-right", resource_route+"santa-right.png");
  resourceManager.addBitmapData("santa-top", resource_route+"santa-top.png");
  resourceManager.addBitmapData("shadow", resource_route+"shadow.png");

  await resourceManager.load();


}

  void changeSprite(BitmapData bitmap1, BitmapData bitmap2) {
    print(time);

    time--;

    if (time == 0) {
      time = 25;

    }else{
      if (time < 12) {

      bitmapData = bitmap2;
    } else {

      bitmapData = bitmap1;
    }
  }




  }

  void addShadow(Shadoow shadoow){

    this.shadoow = shadoow;

  }


}