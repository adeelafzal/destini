import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'StoryBrain.dart';

void main() {
  runApp(Destini());
}

class Destini extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StoryPage(),
    );
  }
}

StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background.png"), fit: BoxFit.cover)),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(storyBrain.getStory(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0
                  ),),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  textColor: Colors.white,
                  child: Text(storyBrain.getChoice1(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0
                  ),),
                  color: Colors.red, onPressed: () {
                  setState(() {
                    storyBrain.nextStory(1);
                  });
                },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: FlatButton(
                    textColor: Colors.white,
                    child: Text(storyBrain.getChoice2(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0
                      ),),
                    color: Colors.blue, onPressed: () {
                      setState(() {
                        storyBrain.nextStory(2);
                      });

                  },
                  ),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
