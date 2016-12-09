
part of santaclaus;

class Tree extends Bitmap implements Animatable {

  num xmap,ymap;
  var random = new math.Random();
  num y_pos,x_pos;

    Tree(BitmapData bitmapData, this.xmap, this.ymap) : super(bitmapData) {
      x = random.nextInt(xmap);
      y = random.nextInt(ymap);
      y_pos= y+bitmapData.height/2 + 60;


    }





  @override
  bool advanceTime(num time) {
    // TODO: implement advanceTime
  }
}
