part of santaclaus;

class Shadoow extends Bitmap implements Animatable{
  Bitmap bitmap;

  Shadoow(BitmapData bitmapData, this.bitmap): super(bitmapData){

    alpha = 0.4;

}





  @override
  bool advanceTime(num time) {



    switch(bitmap.name) {

      case "santa":
        {
          x = bitmap.x - 30;
          y = bitmap.y + 93;
          break;
        }
      case "rabbit":{


        x = bitmap.x;

        
        y = bitmap.y_landed + 45 + (bitmap.shadow_size/2);



        alpha = bitmap.shadow_size / 120;

        break;
      }
  }


    return true;
  }
}