import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mazerunner/Pages/game%20mode/Homepage.dart';
import 'package:mazerunner/Pages/game_mode.dart';

class StartGame extends StatefulWidget {
  const StartGame({super.key});

  @override
  State<StartGame> createState() => _StartGameState();
}

class _StartGameState extends State<StartGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.red, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // if (!_showText) // Placeholder to maintain layout
              SizedBox(
                // Width of the text to keep the layout stable
                height: 100, // Height of the text to keep the layout stable
              ),

                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(height: 100,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                child: Image(image: AssetImage("assets/images/logo.png"),),
                              ),
                              SizedBox(width: 10,),
                              DefaultTextStyle(
                                  style: TextStyle(
                                    fontSize: 30,
                                    // fontFamily: 'Horizon'
                                  ),
                                  child: AnimatedTextKit(
                                      animatedTexts: [
                                        RotateAnimatedText("Maze"),
                                        RotateAnimatedText("Maze Runner "),
                                      ],
                                    isRepeatingAnimation: true,
                                    repeatForever: true,
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Text(
                      //   "Maze Runner logo",
                      //   style: TextStyle(
                      //       fontSize: 40,
                      //       color: Colors.white,
                      //       fontWeight: FontWeight.bold),
                      // ),
                      SizedBox(height: 20,),
                      Text(
                        "Easy the puzzle and so adventure and",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "the best experience game puzzle",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 200,)
                    ],
                  ),
                ),


                GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    // color: Colors.red,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.red,
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text("Let`s Go" , style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w700
                    ),),
                  ),
                  onTap: (){
                    print("Start Game");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => GameMode(),));
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}
