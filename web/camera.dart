part of santaclaus;




class Camera extends Bitmap implements Animatable{

  Stage stage;
  Santa santa;

  List<Bitmap> entities;

  ResourceManager resourceManager;
  var random3 = new math.Random();


  Camera(this.stage,this.santa,this.entities){

  }

  bool advanceTime(num time) {




    if (santa.x > 355) {
      camera.x = -santa.x + 350;
    }

    if (santa.y > 355) {
      camera.y = -santa.y + 300;
    }


    stage.setTransform(this.x, this.y);

    renderEntities();



    return true;
  }

  void renderEntities(){


    for(var i = 0; i<entities.length; i++){
      if(stage.contains(entities.elementAt(i))) {
        stage.removeChild(entities.elementAt(i));
      }


    }


    entities.sort((a, b) => a.y_pos.compareTo(b.y_pos));


    for(var i = 0; i<entities.length; i++){
      entities.elementAt(i).addTo(stage);


    }





  }

}