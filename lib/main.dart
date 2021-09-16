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
              color: Colors.pink,
              child: Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Lesson Name",
                      hintText: "Enter the lesson name",
                      border: OutlineInputBorder(),
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
                ],
              )),
            ),
          ),
          //container holding dynamic list
          Expanded(
            child: Container(
              color: Colors.green,
              child: Text("List"),
            ),
          )
        ],
      ),
    );
  }
}
