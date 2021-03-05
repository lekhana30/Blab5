import 'package:flutter/material.dart';
import 'package:flutter_app4/questions.dart';
void main() {
 runApp(MyApp());
}
class MyApp extends StatefulWidget {
 @override
 _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
 int questionNumber = 0;
 int currentScore = 0;
 List<String> your_choice = [];
 Questions questions = Questions();
 void updateQuestionNumber() {
 setState(() {
 questionNumber = questionNumber + 1;
 });
 }
 void updateCurrentScore(bool choice, int question_number) {
 if (questions.questionBank.length == question_number) {
 print("End of questions");
 } else {
 if (questions.questionBank[question_number].answer == choice) {
 setState(() {
 currentScore++;
 });
 }
 }
 }
 @override
 Widget build(BuildContext context) {
 return MaterialApp(
 home: Scaffold(
 body: Container(
 width: double.infinity,
 margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
 child: Column(
 crossAxisAlignment: CrossAxisAlignment.stretch,
 children: [
 Text(
 questions.questionBank[questionNumber].questionText.toString(),
 style: TextStyle(fontSize: 40),
 ),
 Padding(
 padding: const EdgeInsets.all(8.0),
 child: RaisedButton(
 onPressed: () {
 setState(() {
 your_choice.add("Question " + '${questionNumber + 1}:' + " 
true");
 });
 print("Button 1 is pressed");
 if (questionNumber == questions.questionBank.length) {
 print("End of questions");
 } else {
 updateQuestionNumber();
 updateCurrentScore(true, questionNumber);
 }
 },
 child: Text("True", style: TextStyle(fontSize: 40)),
 ),
 ),
 Padding(
 padding: const EdgeInsets.all(8.0),
 child: RaisedButton(
 onPressed: () {
 setState(() {
 your_choice.add("Question " + '${questionNumber + 1}:' + " 
false");
 });
 /*if (questions.questionBank.length < questionNumber) {*/
 print("Button 2 is pressed");
 if (questionNumber == questions.questionBank.length) {
 print("End of questions");
 } else {
 updateQuestionNumber();
 updateCurrentScore(false, questionNumber);
 }
 },
 child: Text("False", style: TextStyle(fontSize: 40)),
 ),
 ),
 Padding(
 padding: const EdgeInsets.all(30.0),
 child: Center(
 child: Text(
 "Current Score is:",
 style: TextStyle(fontSize: 30),
 ),
 ),
 ),
 Padding(
 padding: const EdgeInsets.all(30.0),
 child: Center(
 child: Text(
 '${currentScore}',
 style: TextStyle(fontSize: 30),
 ),
 ),
 ),
 Padding(
 padding: const EdgeInsets.only(top: 20),
 child: Center(
 child: Text(
 "Your choices:",
 style: TextStyle(fontSize: 30),
 ),
 ),
 ),
 Expanded(
 child: Container(
 child: ListView(
 children: your_choice
 .map((e) => Card(
 elevation: 10,
 child: ListTile(
 title: Text(
 e.toString(),
 ),
 ),
 ))
 .toList(),
 ),
 ),
 )
 ],
 ),
 ),
 ),
 );
 } }
Left pane > lib > new > dartfile > questions.dart
questions.dart:
import 'package:flutter_app4/question.dart';
class Questions {
 List<Question> questionBank = [
 Question(
 questionText: "NMIT is located in Bengaluru",
 answer: true,
 ),
 Question(
 questionText: "Are you studying at NMIT",
 answer: true,
 ),
 Question(
 questionText: "Bangalore is located in J&K",
 answer: false,
 ),
 Question(
 questionText: "Current year is 2020",
 answer: false,
 ),
 Question(
 questionText: "NMIT is located in Bengaluru",
 answer: true,
 ),
 Question(
 questionText: "Are you studying at NMIT",
 answer: true,
 ),
 Question(
 questionText: "Bangalore is located in J&K",
 answer: false,
 ),
 Question(
 questionText: "Current year is 2020",
 answer: false,
 ),
 Question(
 questionText: "Bangalore is located in J&K",
 answer: false,
 ),
 Question(
 questionText: "Current year is 2020",
 answer: false,
 )
 ];
}
