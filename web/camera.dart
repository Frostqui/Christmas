part of santaclaus;




class Camera extends Bitmap implements Animatable{

  Stage stage;
  Santa santa;


  ResourceManager resourceManager;
  var random3 = new math.Random();


  Camera(this.stage,this.santa){

  }

  bool advanceTime(num time) {



    print(santa.x);
    if (santa.x > 355) {
      camera.x = -santa.x + 350;
    }

    if (santa.x > 355) {
      camera.y = -santa.y + 300;
    }


    stage.setTransform(this.x, this.y);



    return true;
  }


}