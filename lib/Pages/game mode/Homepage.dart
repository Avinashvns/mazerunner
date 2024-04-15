import 'dart:async';

import 'package:flutter/material.dart';
import 'package:maze/maze.dart';
import 'package:mazerunner/Pages/game%20mode/next_lavel.dart';
import 'package:mazerunner/Pages/gameover.dart';
import 'package:mazerunner/Utilities/utilities.dart';

class MazeRunner extends StatefulWidget {
  const MazeRunner({super.key});

  @override
  State<MazeRunner> createState() => _MazeRunnerState();
}

class _MazeRunnerState extends State<MazeRunner> {

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
                    child: Text("Level ${Utilities.level}", style: TextStyle(
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
            // Text("Column ${Utilities.col.toString()}" ,style: TextStyle(fontSize: 20),),
            // Text("Row ${Utilities.row.toString()}",style: TextStyle(fontSize: 20),),
            Maze(
              player: MazeItem(
                  // "https://as1.ftcdn.net/v2/jpg/01/88/85/12/1000_F_188851227_n8zdRAsRjjFV6gPsO2EVvu8qftrWmHfQ.jpg",
                  // ImageType.network
                // "assets/images/b.jpeg",
                //   "assets/images/football.png",
                  hero,
                  ImageType.asset
              ),
              columns: Utilities.col,
              rows: Utilities.row,
              wallColor: Colors.black,
              wallThickness: 5,
              finish:
                  MazeItem(
                      // "assets/images/football.png",
                      // "assets/images/b.jpeg",
                      heroine,
                      ImageType.asset),
              onFinish: () {
                print("Ok Over");
                setState(() {
                  if (Utilities.col == 17) {
                    Utilities.col = 17;
                  } else {
                    Utilities.col++;
                  }
                  if (Utilities.row == 21) {
                    Utilities.row = 21;
                  } else {
                    Utilities.row++;
                    Utilities.level++;
                  }
                  // Utilities.row++;
                });

                if (Utilities.col == 17 && Utilities.row == 21) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GameOver(),
                      ));
                } else {
                  timer?.cancel();
                  print(duration.inSeconds);
                  if(duration.inSeconds <= 10){
                    Utilities.timerMessage="Excellent";
                    print(Utilities.timerMessage);
                  }
                  else if(duration.inSeconds > 10 && duration.inSeconds < 18){
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
