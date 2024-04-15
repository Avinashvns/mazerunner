import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mazerunner/Pages/game%20mode/Homepage.dart';
import 'package:mazerunner/Pages/game%20mode/easy_game.dart';
import 'package:mazerunner/Pages/game%20mode/medium_game.dart';
import 'package:mazerunner/Pages/gameover.dart';
import 'package:mazerunner/Utilities/utilities.dart';

class NextLevel extends StatefulWidget {
  const NextLevel({super.key});

  @override
  State<NextLevel> createState() => _NextLevelState();
}

class _NextLevelState extends State<NextLevel> {

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Lottie.asset("assets/animations/celebration.json");
  // }

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // if (!_showText) // Placeholder to maintain layout

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)
                    )
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 30,),
                        Text(
                          "Congratulations",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),

                        // Lottie Image
                        // Utilities.timerMessage=="Excellent" ?
                        // Lottie.asset("assets/animations/gold_achievement.json") : SizedBox(),
                        // Utilities.timerMessage=="Good" ?
                        // Lottie.asset("assets/animations/silver_achievement.json") : SizedBox(),
                        // Utilities.timerMessage=="Not Bad" ?
                        // Lottie.asset("assets/animations/bronze_achievement.json") : SizedBox(),
                        Lottie.asset("assets/animations/dog.json" ,height: 200),

                        SizedBox(height: 10,),
                        Text(
                          "You have Completed the",
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                          ),
                        ),
                        // Image
                        Utilities.mode=="easy"?
                        Text(
                          "Level ${Utilities.easylevel}",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ): SizedBox(),
                        Utilities.mode=="medium"?
                        Text(
                          "Level ${Utilities.mediumlevel}",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ): SizedBox(),
                        Utilities.mode=="hard"?
                        Text(
                          "Level ${Utilities.level}",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ): SizedBox(),

                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // First star (always active)
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.red,
                              child: Icon(Icons.star, color: Colors.white, size: 30),
                            ),
                            SizedBox(width: 10),
                            // Second star (conditionally active based on Utilities.timerMessage)
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Utilities.timerMessage == "Excellent" || Utilities.timerMessage == "Good" ? Colors.red : Colors.grey,
                              child: Icon(Icons.star, color: Colors.white, size: 30),
                            ),

                            SizedBox(width: 10),

                            // Third star (conditionally active based on Utilities.timerMessage)
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Utilities.timerMessage == "Excellent" ? Colors.red : Colors.grey,
                              child: Icon(Icons.star, color: Colors.white, size: 30),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),

                        Text(
                          "${Utilities.timerMessage}",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 30,),
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
                            child: Text("Next Level" , style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w700
                            ),),
                          ),
                          onTap: (){
                            print("Select Mode");
                            if(Utilities.mode=="easy"){
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EasyGame()));
                            }
                            if(Utilities.mode=="medium"){
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MediumGame()));
                            }
                            if(Utilities.mode=="hard"){
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MazeRunner()));
                            }

                          },
                        ),
                        SizedBox(height: 30,),

                      ],
                    ),
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
