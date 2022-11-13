import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterLevel1Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final myController = TextEditingController();
  String userInput = '';

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterLevel1Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
              'What kind of animal is this?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500
              ),
          ),
          Image.asset('images/giraffe.png'),
          Row(
            children: <Widget> [
              Flexible(
                child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: TextField(
                      controller: myController,
                      decoration: const InputDecoration(
                          hintText: 'Species',
                          border: UnderlineInputBorder()
                      ),
                    )
                )
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        userInput = myController.text;

                        if(userInput == 'Giraffe') {
                          Fluttertoast.showToast(
                              msg: "Correct!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        } else {
                          Fluttertoast.showToast(
                              msg: "Incorrect!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                      });
                    },
                    child: const Text(
                      'CONFIRM'
                    )
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}