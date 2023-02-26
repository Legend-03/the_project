import 'package:flutter/material.dart';

class EnterNewHabitBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const EnterNewHabitBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    });

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 4, 16, 80),
      content:  TextField(
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          border: InputBorder.none,
          fillColor: Color.fromARGB(137, 110, 116, 160),
          filled: true
        ),
      ),
      actions: [
        MaterialButton(
          onPressed: onSave,
          child: Text(
            'Save',
            style: TextStyle(color: Colors.white),
          ),
          color: Color.fromARGB(115, 70, 86, 185),
        ),
        MaterialButton(
          onPressed: onCancel,
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.white),
          ),
          color: Color.fromARGB(115, 70, 86, 185),
        ),
      ],
    );
  }
}