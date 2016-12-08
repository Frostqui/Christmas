
part of santaclaus;

class Tree extends Bitmap {

  num xmap,ymap;
  var random = new math.Random();

    Tree(BitmapData bitmapData, this.xmap, this.ymap) : super(bitmapData) {
      x = random.nextInt(xmap);
      y = random.nextInt(ymap);


    }




}
