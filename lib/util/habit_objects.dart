import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';



class HabitObject extends StatelessWidget {
  final String habitName;
  final VoidCallback  onTap;
  final VoidCallback  settingsTap;
  final int timeSpent;
  final int timeGoal;
  final bool habitStarted;  //play/pause button


// Constructors for variables
  const HabitObject({
    Key? key, 
    required this.habitName, 
    required this.onTap, 
    required this.settingsTap, 
    required this.timeSpent,
    required this.timeGoal,
    required this.habitStarted,
    
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(

              // maintaining a distance between Icon & text widgets
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Row: To group progress circle & Habit name
                Row(children: [
                  //progresssssss indicatorrrrrrrrrr
                  GestureDetector(
                    onTap: onTap,
                    child: SizedBox(
                        height: 60,
                        width: 60,
                        // child: SingleChildScrollView(
                  
                        child: Stack(children: [
                          //stack
                          //circle
                          CircularPercentIndicator(radius: 30),
                          // error zoneeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
                          Center(
                              child: SingleChildScrollView(
                                  child: Icon(
                                    habitStarted ? Icons.pause : Icons.play_arrow_outlined)))
                        ])),
                  ),

                  // ---------------------------------------------------------
                  const SizedBox(width: 20),
                  Column(
                      // align in the beginning
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //habit name
                        Text(habitName,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),

//Creating a space between habitName & Progress
                        const SizedBox(height: 5), 

                        //progress
                        Text(timeSpent.toString()+'/'+timeGoal.toString(),
                            style: TextStyle(color: Colors.grey,)),
                            
                      ]),
                ]),
                GestureDetector(
//passing settingsTapped function
                  onTap: settingsTap, 
                  child: Icon(Icons.settings)),
              ])),
    );
  }
}
