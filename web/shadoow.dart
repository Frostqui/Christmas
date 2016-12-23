part of santaclaus;

class Shadoow extends Bitmap implements Animatable{
  Bitmap bitmap;

  Shadoow(BitmapData bitmapData, this.bitmap): super(bitmapData){

    alpha = bitmap.shadow_alpha;

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


        y = bitmap.y_landed + 40;




        if(bitmap.shadow_alpha == 0) {
          alpha = 0;
        }else{
          alpha = bitmap.shadow_size / 150;
        }

        break;
      }

      case "present":{
        if(bitmap.shadow_alpha == 0){
          alpha = 0;
        }
        x = bitmap.x - 6;
        y = bitmap.y + 100;

      }
  }


    return true;
  }
}