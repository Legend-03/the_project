import 'package:flutter/material.dart';
import 'package:pages/util/habit_objects.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.teal[900],
        title: Text('Your Habits'),
        
      ),

// ----------------------------------------------------------
      body: Column(
        children: [
          
          
          //Object- oriented programming
          HabitObject(
            habitName: 'Sleep',
          ),

          HabitObject(
            habitName: 'Read',
          ),
          HabitObject(
            habitName: 'Walk',
          ),

          HabitObject(
            habitName: 'Hydrate',
          ),
          
          HabitObject(
            habitName: 'Hydrate',
          ),
        ],
      )


    );
  }
}