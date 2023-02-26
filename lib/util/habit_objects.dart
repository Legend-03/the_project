import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HabitObject extends StatelessWidget {

  final String habitName;
  // final VoidCallback  onTap;

  const HabitObject({Key? key, required this.habitName}) : super(key: key);

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
                  Container(
                    height:60, width:60,
                    // child: SingleChildScrollView(
                      
                    
                    child: Stack(children: [              //stack
                      //circle
                      CircularPercentIndicator(radius: 30),
                      // error zoneeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
                      Center(child: SingleChildScrollView(child: Icon(Icons.play_arrow_outlined)))
                    ])
                      
                    
                  ),


                  // ---------------------------------------------------------
                  const SizedBox(width:20),
                  Column(
                      // align in the beginning
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //habit name
                        Text(habitName,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),

                        const SizedBox(height: 5), //Creating a space between habitName & Progress

                        //progress
                        const Text('2:00 / 10:00 = 20%',
                            style: TextStyle(
                              color: Colors.grey,
                            )),
                      ]),
                ]),
                Icon(Icons.settings),
              ])),
    );
  }
}
