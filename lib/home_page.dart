import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pages/util/habit_objects.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List of Habit Functionality
  // Datastructure
  List habitList = [
    // [habitName, habitStarted, timeSpent, timeGoal]
    ['Sleep', false, 0, 20],
    ['Walk', false, 0, 20],
    ['Read', false, 0, 20],
    ['Drink Water', false, 0, 20],
  ];

  void habitStarted(int index) {

    //start timr
    var startTime = DateTime.now();

    

    setState(() {
      // creating contrast between pause & play with onTap
      habitList[index][1] =!habitList[index][1];

      // Time going
      Timer.periodic(Duration(seconds: 1), (timer){
        setState(() {
          // stop timer
        if(!habitList[index][1]){
          timer.cancel();   //Timer will run until this condition is satisfied
        }

        //Elapsed time
        var currentTime = DateTime.now();
        habitList[index][2] = currentTime.second - startTime.second;
        });



      });

    });
  }
  void settingsOpened(int index){
    showDialog(context: context, builder: (context){
      // alert as per the habitName: habitList-->0
      return AlertDialog(title: Text('Settings for '+ habitList[index][0]));
      });  
    }
    
      
  

  @override
  Widget build(BuildContext context) {
    
    // var habitList;
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.teal[900],
          title: const Text('Your Habits'),
        ),

// ----------------------------------------------------------
        body: ListView.builder(
          // Items to build
          itemCount: habitList.length,

          itemBuilder: ((context, index){
          return HabitObject(   //Object- oriented programming
              // Datatype: List
              habitName: habitList[index][0],
              onTap: () {
                habitStarted(index);
              },
              settingsTap: () {
                settingsOpened(index);
              },
              
              habitStarted: habitList[index][1],
              timeSpent: habitList[index][2],
              timeGoal: habitList[index][3],
              
            );
          
        })));
  }
  
}  
  

