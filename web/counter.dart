part of santaclaus;



class Counter extends DisplayObjectContainer {

  final String text;
  var textField1;
  var textFormat1;


  Counter(this.text){

    textField1 = new TextField();
    textFormat1 = new TextFormat('Helvetica,Arial', 30, Color.White, bold:true);
    textField1.defaultTextFormat = textFormat1;
    textField1.text = text;
    textField1.x = 10;
    textField1.y = 10;
    textField1.width = 100;
    textField1.height = 40;
    addChild(textField1);

  }

  void setText(num score){

    textField1.text = score.toString();

    addChild(textField1);
  }
}