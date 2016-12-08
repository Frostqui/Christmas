part of santaclaus;



class Snow extends Bitmap implements Animatable {
  num _vx, _vy;
  num xpos,ypos;
  Camera camera;
  var position = 0;

  var random = new math.Random();
  Snow(BitmapData bitmapData, this._vx, this._vy,this.xpos,this.ypos,this.camera) : super(bitmapData) {
    xpos = -camera.x;
    ypos = -camera.y;

    x = random.nextInt(1200)+xpos;
    y = random.nextInt(1500)-ypos ;
    y = -y;


  }


  bool advanceTime(num time) {

    xpos = -camera.x;
    ypos = -camera.y;

    var pos = random.nextInt(360);


    if(pos % 20 == 0){
      position+=1;

    }

    x = x + random.nextInt(200)* math.sin(position) * time;
    y = y + _vy * time;

    if(y > ypos + 600){
      x = random.nextInt(1000)+xpos;
      y = random.nextInt(1000)+ypos;
      y = -y;

    }

    return true;
  }

}