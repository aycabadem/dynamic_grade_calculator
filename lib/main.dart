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
  //double lessonLetterValue = 4;
  List<Lesson> allLesson;
  var formKey = GlobalKey<FormState>();
  double average = 0;

  @override
  @override
  void initState() {
    super.initState();
    allLesson = [];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      //Klavye tıklandığında kayma sebepli hata çıkarsa diye false atandı.
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Calculate Grade"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formKey.currentState.validate()) {
            formKey.currentState.save();
          }
        },
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
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            //color: Colors.pink.shade200,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Lesson Name",
                      hintText: "Enter the lesson name",
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink, width: 2)),
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
                      setState(() {
                        allLesson
                            .add(Lesson(lessonName, letterGrade, lessonCredit));
                            average = 0;
                            calculateAverage();
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<int>(
                            items: lessonCreditItems(),
                            value: lessonCredit,
                            onChanged: (selectedCredit) {
                              setState(() {
                                lessonCredit = selectedCredit;
                              });
                            },
                          ),
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
                          underline: SizedBox(),
                          items: lessonLetterValuesItems(),
                          value: letterGrade,
                          onChanged: (selectedLetter) {
                            setState(() {
                              letterGrade = selectedLetter;
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
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            child: Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Ortalama :",
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                    TextSpan(
                      text: "${average.toStringAsFixed(2)}",
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            height: 70,
            decoration: BoxDecoration(
              border: BorderDirectional(
                top: BorderSide(color: Colors.blue, width: 2),
                bottom: BorderSide(color: Colors.blue, width: 2),
              ),
            ),
          ),
          //container holding dynamic list
          Expanded(
            child: Container(
                color: Colors.green.shade200,
                child: ListView.builder(
                  itemBuilder: _createListElements,
                  itemCount: allLesson.length,
                )),
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

  Widget _createListElements(BuildContext context, int index) {
    return Card(
      child: ListTile(
        title: Text(allLesson[index].name),
        subtitle: Text(allLesson[index].credit.toString() +
            "Kredi, Harf Notu : " +
            allLesson[index].letterValue.toString()),
      ),
    );
  }

  void calculateAverage() {
    double sumGrade = 0;
    double sumCredit =0;
    for(var oankiDers in allLesson){
      var credit = oankiDers.credit;
      var letterValue = oankiDers.letterValue;
      sumGrade += (letterValue * credit);
      sumCredit += credit;
    }
    average = sumGrade/sumCredit;
  }
}

class Lesson {
  String name;
  double letterValue;
  int credit;

  Lesson(this.name, this.letterValue, this.credit);
}
