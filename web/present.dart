part of santaclaus;

    class Present extends Bitmap implements Animatable {

      num direction;
      num speed = 400;
      num x_pos;
      num y_pos;
      num shadow_alpha = 0.2;
      String name = "present";

    Present(BitmapData bitmapData, this.x_pos,this.y_pos,this.direction): super(bitmapData){
      name="present";
      x = x_pos;
      y = y_pos;




    }

      bool advanceTime(num time) {

        switch(direction){
          case 0:
            x += speed *time;
            break;
          case 1:
            y += speed *time;
            break;
          case 2:
            x -= speed *time;
            break;
          case 3:
            y -= speed *time;
            break;

        }
        y_pos = y;
    return true;

      }


}
