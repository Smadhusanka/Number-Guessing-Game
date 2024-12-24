import 'package:flutter/material.dart';
import 'dart:math'; // Import to generate random numbers
import 'splash.dart';

class TextBoxAndButtonExample extends StatefulWidget {
  @override
  _TextBoxAndButtonExampleState createState() =>
      _TextBoxAndButtonExampleState();
}

class _TextBoxAndButtonExampleState extends State<TextBoxAndButtonExample> {
  final TextEditingController _controller = TextEditingController();
  String _message = '';
  String _messageTwo = '';
  int _randomNumber = 0;

  @override
  void initState() {
    super.initState();
    _generateRandomNumber();
  }

  // Function to generate random number between 1 and 10
  void _generateRandomNumber() {
    _randomNumber = Random().nextInt(10) + 1;
  }

  // Function to check if the user's input is correct
  void _checkAnswer() {
    final enteredNumber = int.tryParse(_controller.text);

    if (enteredNumber == null) {
      setState(() {
        _message = 'Please enter a valid number.';
      });
    } else if (enteredNumber > 10) {
      setState(() {
        _message = 'Please enter a number between 1-10';
      });
    } else if (enteredNumber == _randomNumber) {
      setState(() {
        _message = 'Correct! The number was';
        _messageTwo = '$_randomNumber';
      });
    } else {
      setState(() {
        _message = 'Wrong! The correct number was';
        _messageTwo = '$_randomNumber';
      });
    }
    _generateRandomNumber(); // Generate a new random number after checking
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Guessing Game'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _message,
              style: TextStyle(fontSize: 18,),
            ),
            SizedBox(height: 20),
            Text(
              _messageTwo,
              style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter a number between 1 and 10',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkAnswer,
              child: Text('Check Answer'),  
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, // This hides the debug banner
    title: 'Number Guessing Game',
    routes: {
        '/': (context) => SplashScreen(), // Initial route
        '/home': (context) => TextBoxAndButtonExample(),
      }, 
  ));
}
