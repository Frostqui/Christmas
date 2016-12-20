part of santaclaus;

class Rabbit extends Bitmap implements Animatable{


  num x_dest, y_dest;

  var random = new math.Random();

  var random1 = new math.Random();
  var random2 = new math.Random();

  num speed = 100;

  num jump = 2;
  num jump_time;
  num jump_land;

  bool jumping,landing;

  num xmap,ymap;

  num y_pos;

  num y_landed;

  BitmapData bitmapData2;
  BitmapData bitmapData3;

  num shadow_size;

  num shadow_alpha = 0.4;







  Rabbit(BitmapData bitmapData,this.bitmapData2,this.bitmapData3, this.xmap, this.ymap): super(bitmapData){

    shadow_size = 30;
    y_landed = y;

    name="rabbit";

    x = random.nextInt(xmap);
    y = random.nextInt(ymap);

    x_dest = random1.nextInt(xmap - 16) + 16;
    y_dest = random2.nextInt(ymap - 16) + 16;

    jump_time = random.nextInt(20)+20;
    jump_land = random.nextInt(20)+20;

    jumping = true;
    landing = false;



    jump = random.nextInt(2)+1;





  }





  @override
  bool advanceTime(num time) {





    if((x - x_dest).abs() < 30 || (y - y_dest).abs() < 30 ){


      x_dest = random1.nextInt(xmap - 16) + 16;
      y_dest = random2.nextInt(ymap - 16) + 16;



    }else{


      if(jumping && jump_time >= 0){

        if(shadow_size > 0) {
          shadow_size--;
        }
        landing = false;
        jump_time -- ;
        y -= jump;



      }else{

        y_landed = y;
        landing = true;
        jump_time = random.nextInt(20)+20;
      }


      if(landing && jump_land >= 0){

        if(shadow_size < 30) {
          shadow_size++;
        }
        jumping = false;
        jump_land --;
        y += jump;



      }else{

        y_landed = y;
        jumping = true;
        jump_land = random.nextInt(20)+20;

      }



      if(x < x_dest){

        bitmapData=bitmapData2;

        x += speed * time;

      }

      if(x > x_dest){
        bitmapData=bitmapData3;
        x -= speed * time;;

      }


      if(y < y_dest){

        bitmapData=bitmapData3;
        y += speed * time;;

      }


      if(y < y_dest){
        bitmapData=bitmapData2;
        y += speed * time;;

      }







    }

    y_pos = y;

    return true;

  }




}

