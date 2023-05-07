import 'package:calculater_app/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class calculater extends StatefulWidget {
  const calculater({super.key});

  @override
  State<calculater> createState() => _calculaterState();
}

class _calculaterState extends State<calculater> {

  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(

          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.centerRight,
                        child: Text(
                          userInput,
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        alignment: Alignment.centerRight,
                        child: Text(
                          answer,
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ]),
              ),
            ),

            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        mybutton(title: 'AC',onpress: () {
                          setState(() {
                            userInput = '';
                            answer = '0';
                          });
                        },),
                        mybutton(title: '+/-',onpress: () {

                        },),
                        mybutton(title: '%',onpress: () {
                          setState(() {
                            userInput += '%';
                          });
                        },),
                        mybutton(title: '/',onpress: () {
                          setState(() {
                            userInput += '/';
                          });
                        }, color: Color(0xffffa00a),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        mybutton(title: '7',onpress: () {
                          setState(() {
                            userInput += '7';
                          });
                        },),
                        mybutton(title: '8',onpress: () {
                          setState(() {
                            userInput += '8';
                          });
                        },),
                        mybutton(title: '0',onpress: () {
                          setState(() {
                            userInput += '0';
                          });
                        },),
                        mybutton(title: 'x',onpress: () {
                          setState(() {
                            userInput += 'x';
                          });
                        }, color: Color(0xffffa00a),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        mybutton(title: '4',onpress: () {
                          setState(() {
                            userInput += '4';
                          });
                        },),
                        mybutton(title: '5',onpress: () {
                          setState(() {
                            userInput += '5';
                          });
                        },),
                        mybutton(title: '6',onpress: () {
                          setState(() {
                            userInput += '6';
                          });
                        },),
                        mybutton(title: '-',onpress: () {
                          setState(() {
                            userInput += '-';
                          });
                        }, color: Color(0xffffa00a),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        mybutton(title: '1', onpress: () {
                          setState(() {
                            userInput += '1';
                          });
                        },
                        ),
                        mybutton(title: '2',onpress: () {
                          setState(() {
                            userInput += '2';
                          });
                        },),
                        mybutton(title: '3',onpress: () {
                          setState(() {
                            userInput += '3';
                          });
                        },),
                        mybutton(title: '+', onpress: () {
                          setState(() {
                            userInput += '+';
                          });
                        },color: Color(0xffffa00a),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        mybutton(title: '0',onpress: () {
                          setState(() {
                            userInput += '0';
                          });
                        },),
                        mybutton(title: '.',onpress: () {
                          setState(() {
                            userInput += '.';
                          });
                        },),
                        mybutton(title: 'DEL',onpress: () {
                          setState(() {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                          });
                        },),
                        mybutton(title: '=', onpress: () {
                          equalPressed();
                          setState(() {

                          });
                        },color: Color(0xffffa00a),),
                      ],
                    ),
                  ),

                ],
              ),
            ),


          ],
        ),
      ),
    );
  }


  void equalPressed() {

    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }


}






/*class     mybutton extends StatelessWidget {
  String title;
       mybutton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(child: Text(title, style: TextStyle(fontSize: 25,fontWeight: FontWeight.w100),)),
      ),
    );
  }
}*/
