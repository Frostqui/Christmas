library santaclaus;

import 'dart:math' as math;
import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';


part 'santa.dart';
part 'snow.dart';
part 'tile.dart';
part 'camera.dart';

Santa santa;
Camera camera;



num _averageFrameRate = 60.0;

var x_map = 1200;
var y_map = 1200;

main() async {
  // setup the Stage and RenderLoop
  var canvas = html.querySelector('#stage');
  var stage = new Stage(canvas);
  stage.backgroundColor = Color.Blue;
  stage.scaleMode = StageScaleMode.NO_SCALE;






  var renderLoop = new RenderLoop();
  renderLoop.addStage(stage);





  var resourceManager = new ResourceManager();


  resourceManager.addBitmapData("tile1", "tile1.png");

  resourceManager.addBitmapData("tile2", "tile2.png");

  resourceManager.addBitmapData("tile3", "tile3.png");
  resourceManager.addBitmapData("tile4", "tile4.png");



  resourceManager.addBitmapData("santa", "santa.png");
  resourceManager.addBitmapData("snow", "snow.png");



  await resourceManager.load();




  var x_size = x_map  / resourceManager.getBitmapData("tile2").width;
  var y_size = y_map / resourceManager.getBitmapData("tile2").height;


  var random2 = new math.Random();
  var random3 = new math.Random();



  for (var i = 0; i< x_size; i++){
    for (var j = 0; j< y_size; j++) {
      if (random3.nextInt(15) > 13) {
        var tile = new Tile(resourceManager.getBitmapData("tile4"));
        tile.x = tile.width * i;
        tile.y = tile.height * j;

        tile.addTo(stage);
      } else {


      var f = 1 + random2.nextInt(3);
      var tile = new Tile(resourceManager.getBitmapData("tile$f"));
      tile.x = tile.width * i;
      tile.y = tile.height * j;

      tile.addTo(stage);

      }








    }


  }


  var random = new math.Random();





  santa = new Santa(resourceManager.getBitmapData("santa"), 200, 200);

  stage.addChild(santa);
  stage.juggler.add(santa);
  stage.focus = stage;



  var tile = new Tile(resourceManager.getBitmapData("tile2"));

  camera = new Camera(stage,santa);

  stage.juggler.add(camera);

  for (var i = 0; i < 170; i++) {

    var size = random.nextInt(15);
    var snow = new Snow(resourceManager.getBitmapData("snow"), 200, 200,santa.x,santa.y,camera);
    snow.width = size;
    snow.height = size;
    snow.addTo(stage);
    stage.juggler.add(snow);
  }


  //cursor keys
  const leftArrow = 37;
  const upArrow = 38;
  const rightArrow = 39;
  const downArrow = 40;

  stage.onKeyDown.listen((value) {


      //switch statemant to decide which cursor keys was down
      switch (value.keyCode) {
        case leftArrow:

            santa.movingLeft = true;



          break;
        case upArrow:

            santa.movingUp = true;



          break;
        case rightArrow:
          santa.movingRight = true;


          break;
        case downArrow:
          santa.movingDown = true;

          break;
      }

  });

  stage.onKeyUp.listen((value){

    switch(value.keyCode){
      case leftArrow:
        santa.movingLeft = false;
        break;
      case upArrow:
        santa.movingUp = false;
        break;
      case rightArrow:
        santa.movingRight = false;
        break;
      case downArrow:
        santa.movingDown = false;
        break;
    }

  });

}

