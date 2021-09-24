import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String lessonName;
  int lessonCredit = 1;
  double letterGrade = 4;
  double lessonLetterValue = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculate Grade"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: appBody(),
    );
  }

  appBody() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //container holding static form
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.pink.shade200,
              child: Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Lesson Name",
                      hintText: "Enter the lesson name",
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 2)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.pink, width: 2)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    validator: (enteredValue) {
                      if (enteredValue.length > 0) {
                        return null;
                      } else
                        return "Lesson name cannot be empty";
                    },
                    onSaved: (valueToSave) {
                      lessonName = valueToSave;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: DropdownButton<int>(
                          items: lessonCreditItems(),
                          value: lessonCredit,
                          onChanged: (selectedCredit) {
                            setState(() {
                              lessonCredit = selectedCredit;
                            });
                          },
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                      Container(
                        child: DropdownButton<double>(
                          items: lessonLetterValuesItems(),
                          value: lessonLetterValue,
                          onChanged: (selectedLetter) {
                            setState(() {
                              lessonLetterValue = selectedLetter;
                            });
                          },
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      )
                    ],
                  )
                ],
              )),
            ),
          ),
          //container holding dynamic list
          Expanded(
            child: Container(
              color: Colors.green.shade200,
              child: Text("List"),
            ),
          )
        ],
      ),
    );
  }

  List<DropdownMenuItem<int>> lessonCreditItems() {
    List<DropdownMenuItem<int>> credits = [];

    for (int i = 1; i <= 10; i++) {
      credits.add(
        DropdownMenuItem<int>(
          value: i,
          child: Text(
            "$i Credit",
            style: TextStyle(fontSize: 30),
          ),
        ),
      );
    }
    return credits;
  }

  List<DropdownMenuItem<double>> lessonLetterValuesItems() {
    List<DropdownMenuItem<double>> letters = [];

    letters.add(DropdownMenuItem(
      child: Text(
        "AA",
        style: TextStyle(fontSize: 30),
      ),
      value: 4,
    ));
    letters.add(DropdownMenuItem(
      child: Text(
        "BA",
        style: TextStyle(fontSize: 30),
      ),
      value: 3.5,
    ));
    letters.add(DropdownMenuItem(
      child: Text(
        "BB",
        style: TextStyle(fontSize: 30),
      ),
      value: 3.0,
    ));
    letters.add(DropdownMenuItem(
      child: Text(
        "CB",
        style: TextStyle(fontSize: 30),
      ),
      value: 2.5,
    ));
    letters.add(DropdownMenuItem(
      child: Text(
        "CC",
        style: TextStyle(fontSize: 30),
      ),
      value: 2,
    ));
    letters.add(DropdownMenuItem(
        child: Text(
          "DC",
          style: TextStyle(fontSize: 30),
        ),
        value: 1.5));
    letters.add(DropdownMenuItem(
      child: Text(
        "DD",
        style: TextStyle(fontSize: 30),
      ),
      value: 1,
    ));
    letters.add(DropdownMenuItem(
      child: Text(
        "FD",
        style: TextStyle(fontSize: 30),
      ),
      value: 0.5,
    ));
    letters.add(DropdownMenuItem(
      child: Text(
        "FF",
        style: TextStyle(
          fontSize: 30,
        ),
      ),
      value: 0,
    ));

    return letters;
  }
}
