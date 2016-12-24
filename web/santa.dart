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
  num direction;

  bool canShoot = true;
  num cooldown = 50;




  num time = 25;
  num time2 = 28;


  var resource_route = "img/";

  num shadow_alpha = 0.5;



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


    checkIfICanShoot();
    //shadoow.setX(santa.x + 30);


    if(movingLeft){
      direction = 2;
      bitmapData = resourceManager.getBitmapData("santa-left");
      if(santa.x>70) {
        changeSprite2(resourceManager.getBitmapData("santa-left"),resourceManager.getBitmapData("santa-left-1"), resourceManager.getBitmapData("santa-left-2"));



        x = x - _vx * time;
      }
    }else if(movingRight){
      direction = 0;
      x = x + _vx * time;
      //
      // bitmapData=resourceManager.getBitmapData("santa-right");

      changeSprite2(resourceManager.getBitmapData("santa-right"),resourceManager.getBitmapData("santa-right-1"), resourceManager.getBitmapData("santa-right-2"));
      //changeSprite(resourceManager.getBitmapData("santa-right"),resourceManager.getBitmapData("santa-right-1"));
    }
    if(movingUp){
      direction = 3;
      if(santa.y > 90) {
        y = y - _vy * time;

      }
      changeSprite(resourceManager.getBitmapData("santa-top1"),resourceManager.getBitmapData("santa-top2"));
    }else if(movingDown){

      direction = 1;
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

  resourceManager.addBitmapData("santa-left-1", resource_route+"santa-left-1.png");
  resourceManager.addBitmapData("santa-left-2", resource_route+"santa-left-2.png");




  resourceManager.addBitmapData("santa-right", resource_route+"santa-right.png");
  resourceManager.addBitmapData("santa-right-1", resource_route+"santa-right-1.png");
  resourceManager.addBitmapData("santa-right-2", resource_route+"santa-right-2.png");

  resourceManager.addBitmapData("santa-top1", resource_route+"santa-top1.png");

  resourceManager.addBitmapData("santa-top2", resource_route+"santa-top2.png");

  resourceManager.addBitmapData("shadow", resource_route+"shadow.png");

  await resourceManager.load();


}

  void changeSprite2(BitmapData bitmap1, BitmapData bitmap2, BitmapData bitmap3)
  {


    time2--;

    if (time2 == 0) {
      time2 = 28;

    }else{
      if (time2 < 7) {

        bitmapData = bitmap3;
      } else if (time2 < 14){

        bitmapData = bitmap1;
      }else if(time2 < 21){
        bitmapData = bitmap2;
      }else{
        bitmapData = bitmap1;
      }
    }

  }


    void changeSprite(BitmapData bitmap1, BitmapData bitmap2) {


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

  void checkIfICanShoot(){
    if(!canShoot){
      cooldown--;
      if(cooldown <= 0){
        cooldown = 50;
        canShoot = true;
      }
    }

  }


}