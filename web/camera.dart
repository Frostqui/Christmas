part of santaclaus;




class Camera extends Bitmap implements Animatable{

  Stage stage;
  Santa santa;
  Counter counter;

  num score = 0;


  List<Bitmap> entities;
  List<Bitmap> presents;
  List<Bitmap> rabbits;

  ResourceManager resourceManager;
  var random3 = new math.Random();

  num x_map,ymap;




  Camera(this.stage,this.santa,this.entities,this.presents, this.rabbits, this.x_map, this.ymap, this.resourceManager, this.counter){


  }

  bool advanceTime(num time) {





    for(num i = 0; i<presents.length; i++){



      if(presents.elementAt(i).x > 355 && presents.elementAt(i).x < x_map - (64 * 3)-220) {
        if(stage.contains(presents.elementAt(i))) {
          stage.removeChild(presents.elementAt(i));
        }
        /*if(presents.contains(presents.elementAt(i))) {
          presents.remove(presents.elementAt(i));
        }
        */
      }

      if (presents.elementAt(i).y > 355 && presents.elementAt(i).y < ymap - (64 * 2)-200) {
        if(stage.contains(presents.elementAt(i))) {
          stage.removeChild(presents.elementAt(i));
        }
       /* if(presents.contains(presents.elementAt(i))) {
          presents.remove(presents.elementAt(i));
        }
        */
      }



    }




    if (santa.x > 355 && santa.x < x_map - (64 * 3)-220) {
      camera.x = -santa.x + 350;
      counter.x = santa.x - 330;
    }

    if (santa.y > 355 && santa.y < ymap - (64 * 2)-200) {
      camera.y = -santa.y + 300;
      counter.y = santa.y - 300;
    }







    counter.setText(score);



    stage.setTransform(this.x, this.y);

    renderEntities();

   checkCollisions();




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

    stage.removeChild(counter);
    counter.addTo(stage);






  }


void checkCollisions() {


  presents.forEach((present) {

    rabbits.forEach((rabbit){
      if(rabbit.hitTestObject(present)) {






        score++;
        present.shadow_alpha = 0;
        stage.removeChild(present);
        stage.juggler.remove(present);

        rabbit.setRandomPos();





        entities.remove(present);

      }


      });
  });

 }



}