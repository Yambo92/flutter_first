import 'package:flutter/material.dart';

import "./quiz.dart";
import "./result.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": 'whats your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {"text": 'Red', 'score': 2},
        {"text": 'Green', 'score': 1},
        {"text": 'White', 'score': 2},
      ]
    },
    {
      "questionText": 'whats your favorite animal',
      'answers': [
        {'text': 'bear', 'score': 1},
        {'text': 'Rabbit', 'score': 2},
        {'text': 'Snake', 'score': 2},
        {'text': 'Elephant', 'score': 2},
      ]
    },
    {
      "questionText": 'who is your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 2},
        {'text': 'Rabbit', 'score': 2},
        {'text': 'Snake', 'score': 2},
        {'text': 'Elephant', 'score': 2},
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    setState(() {
      _totalScore = _totalScore + score;
      print(_totalScore);
      if (_questionIndex < _questions.length) {
        _questionIndex = _questionIndex + 1;
      } else {
        _questionIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
