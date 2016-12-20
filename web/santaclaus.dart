library santaclaus;

import 'dart:math' as math;
import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';


part 'santa.dart';
part 'snow.dart';
part 'tile.dart';
part 'camera.dart';
part 'tree.dart';
part 'rabbit.dart';
part 'shadoow.dart';
part 'present.dart';

Santa santa;
Camera camera;
Shadoow shadoow;
Present present;

var stage;

num _averageFrameRate = 60.0;

var x_map = 2000;
var y_map = 2000;

List<Bitmap> entities =  new List<Bitmap>();
List<Bitmap> presents =  new List<Bitmap>();
List<Bitmap> rabbits =  new List<Bitmap>();

var resourceManager;

var random2 = new math.Random();
var random3 = new math.Random();
var random4 = new math.Random();
var random =  new math.Random();

var resource_route = "img/";

main() async {
  // setup the Stage and RenderLoop


  var canvas = html.querySelector('#stage');
  stage = new Stage(canvas);
  stage.backgroundColor = Color.Blue;
  stage.scaleMode = StageScaleMode.NO_SCALE;






  var renderLoop = new RenderLoop();
  renderLoop.addStage(stage);





  resourceManager = new ResourceManager();

  resourceManager.addBitmapData("tile1", resource_route+"tile1.png");
  resourceManager.addBitmapData("tile2", resource_route+"tile2.png");
  resourceManager.addBitmapData("tile3", resource_route+"tile3.png");
  resourceManager.addBitmapData("tile4", resource_route+"tile4.png");


  resourceManager.addBitmapData("santa", resource_route+"santa.png");
  resourceManager.addBitmapData("present", resource_route+"present.png");
  resourceManager.addBitmapData("snow", resource_route+"snow.png");
  resourceManager.addBitmapData("tree", resource_route+"tree.png");
  resourceManager.addBitmapData("rabbit", resource_route+"rabbit.png");
  resourceManager.addBitmapData("rabbit-right", resource_route+"rabbit-right.png");

  resourceManager.addBitmapData("shadow", resource_route+"shadow.png");



  await resourceManager.load();




  createMap();


  santa = new Santa(resourceManager.getBitmapData("santa"), 200, 200);
  entities.add(santa);
  stage.addChild(santa);
  stage.juggler.add(santa);



  shadoow = new Shadoow(resourceManager.getBitmapData("shadow"),santa);

  shadoow.addTo(stage);
  stage.juggler.add(shadoow);
  santa.addShadow(shadoow);

  stage.focus = stage;


  for (var i = 0; i < 15; i++) {


    var rabbit = new Rabbit(resourceManager.getBitmapData("rabbit"),resourceManager.getBitmapData("rabbit-right"),resourceManager.getBitmapData("rabbit"), x_map, y_map);

    entities.add(rabbit);
    rabbit.addTo(stage);
    stage.juggler.add(rabbit);

    rabbits.add(rabbit);

    shadoow = new Shadoow(resourceManager.getBitmapData("shadow"),rabbit);

    shadoow.addTo(stage);
    stage.juggler.add(shadoow);


  }



  var tile = new Tile(resourceManager.getBitmapData("tile2"));

  camera = new Camera(stage,santa,entities,presents,rabbits,x_map,y_map);
  stage.juggler.add(camera);

  for (var i = 0; i < 200; i++) {


    var size = random.nextInt(15);
    random4 = random.nextInt(100)+100;
    var snow = new Snow(resourceManager.getBitmapData("snow"), 200, random4,santa.x,santa.y,camera);
    snow.width = size;
    snow.height = size;

    snow.addTo(stage);
    stage.juggler.add(snow);
  }

  for (var i = 0; i < 15; i++) {


    var tree = new Tree(resourceManager.getBitmapData("tree"), x_map, y_map);
    entities.add(tree);

    tree.addTo(stage);

  }




  //cursor keys
  const leftArrow = 37;
  const upArrow = 38;
  const rightArrow = 39;
  const downArrow = 40;
  const spaceBar = 32;



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

      if(value.keyCode == spaceBar){

        present = new Present(resourceManager.getBitmapData("present"),santa.x,santa.y,santa.direction);
        entities.add(present);
        stage.addChild(present);
        stage.juggler.add(present);


        presents.add(present);



        shadoow = new Shadoow(resourceManager.getBitmapData("shadow"),present);
        shadoow.addTo(stage);
        stage.juggler.add(shadoow);
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

void createMap(){

  var x_size = x_map  / resourceManager.getBitmapData("tile2").width;
  var y_size = y_map / resourceManager.getBitmapData("tile2").height;


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

}

