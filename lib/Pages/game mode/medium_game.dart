import 'dart:async';

import 'package:flutter/material.dart';
import 'package:maze/maze.dart';
import 'package:mazerunner/Pages/game%20mode/next_lavel.dart';
import 'package:mazerunner/Pages/gameover.dart';
import 'package:mazerunner/Utilities/utilities.dart';

class MediumGame extends StatefulWidget {
  const MediumGame({super.key});

  @override
  State<MediumGame> createState() => _MediumGameState();
}

class _MediumGameState extends State<MediumGame> {
  Color color= getRandomColor();
  Timer? timer;
  Duration duration=Duration();
  String hero="";
  String heroine="";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
    if(Utilities.selecttile=="dog"){
      hero="assets/images/bone.png";
      heroine="assets/images/dog.png";
    }
    if(Utilities.selecttile=="cat"){
      hero="assets/images/fish.png";
      heroine="assets/images/cat.png";
    }
    if(Utilities.selecttile=="ball"){
      hero="assets/images/football.png";
      heroine="assets/images/dog.png";
    }
  }

  void startTimer(){
    timer= Timer.periodic(Duration(seconds: 1), (_) {
      final addSeconds=1;
      setState(() {
        final newseconds= duration.inSeconds+addSeconds;

        duration=Duration(seconds: newseconds);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2,"0");
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Scaffold(
      backgroundColor: color,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  // color: Colors.green,
                  height: 10,
                ),
                Positioned(
                    left: MediaQuery.of(context).size.width / 3,
                    bottom: -100,
                    child: Text("Level ${Utilities.mediumlevel}", style: TextStyle(
                      fontSize: 40,
                    ), )
                ),
                Positioned(
                    left: MediaQuery.of(context).size.width / 3,
                    bottom: -150,
                    child: Text("$minutes : $seconds", style: TextStyle(
                        fontSize: 40,
                        color: Colors.white
                    ), )
                ),
              ],
            ),
            // Text("Column ${Utilities.mediumcol.toString()}" ,style: TextStyle(fontSize: 20),),
            // Text("Row ${Utilities.mediumrow.toString()}",style: TextStyle(fontSize: 20),),
            Maze(
              player: MazeItem(
                // "https://as1.ftcdn.net/v2/jpg/01/88/85/12/1000_F_188851227_n8zdRAsRjjFV6gPsO2EVvu8qftrWmHfQ.jpg",
                // ImageType.network
                // "assets/images/b.jpeg",
                //   "assets/images/bone.png",
                hero,
                  ImageType.asset

              ),
              columns: Utilities.mediumcol,
              rows: Utilities.mediumrow,
              wallColor: Colors.black,
              wallThickness: 5,
              finish:
              MazeItem(
                // "assets/images/football.png",
                //   "assets/images/dog.png",
                heroine,
                  ImageType.asset),
              onFinish: () {
                print("Ok Over");
                setState(() {
                  if (Utilities.mediumcol == 12) {
                    Utilities.mediumcol = 12;
                  } else {
                    Utilities.mediumcol++;
                  }
                  if (Utilities.mediumrow == 16) {
                    Utilities.mediumrow = 16;
                    Utilities.mediumlevel=17;
                  } else {
                    Utilities.mediumrow++;
                    Utilities.mediumlevel++;
                  }
                  // Utilities.row++;
                });

                if (Utilities.mediumcol == 12 && Utilities.mediumrow == 16) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GameOver(),
                      ));
                } else {
                  timer?.cancel();
                  print(duration.inSeconds);
                  if(duration.inSeconds <= 9){
                    Utilities.timerMessage="Excellent";
                    print(Utilities.timerMessage);
                  }
                  else if(duration.inSeconds > 9 && duration.inSeconds < 13){
                    Utilities.timerMessage="Good";
                    print(Utilities.timerMessage);
                  }else{
                    Utilities.timerMessage="Not Bad";
                    print(Utilities.timerMessage);
                  }

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NextLevel()));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
