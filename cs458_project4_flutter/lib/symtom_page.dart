import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var symptomArr = [false, false, false, false, false, false];
  TextEditingController feverController = TextEditingController();
  // 0: Dry Cough, 1:  Loss of taste, 2:  Loss of smell, 3:  Sore throat, 4:  Headache, 5:  Tiredness, 6:  Fever
  void __Send_symptoms__() async {
    try {
      var url = Uri.parse('http://localhost:8080/api/symptoms');
      double fever = double.parse(feverController.text);
      var requestBody = {
        "dryCough": symptomArr[0],
        "fever": fever > 38,
        "headache": symptomArr[4],
        "lossOfSmell": symptomArr[2],
        "lossOfTaste": symptomArr[1],
        "soreThroat": symptomArr[3],
        "tiredness": symptomArr[5],
        "userId": 9
      };
      print(requestBody);

      var response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encoder.convert(requestBody),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      final res_body = jsonDecode(response.body);
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => MonitorPage()),
      // );
      //print(res_body['originalURL']);
      setState(() {});
    } catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Choose your symptoms',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Dry Cough',
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.w500,
                      fontSize: 25),
                ),
                Checkbox(
                  value: symptomArr[0],
                  onChanged: (value) {
                    setState(() {
                      symptomArr[0] = value;
                    });
                    print(symptomArr);
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Loss of taste',
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.w500,
                      fontSize: 25),
                ),
                Checkbox(
                  value: symptomArr[1],
                  onChanged: (value) {
                    setState(() {
                      symptomArr[1] = value;
                    });
                    print(symptomArr);
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Loss of smell',
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.w500,
                      fontSize: 25),
                ),
                Checkbox(
                  value: symptomArr[2],
                  onChanged: (value) {
                    setState(() {
                      symptomArr[2] = value;
                    });
                    print(symptomArr);
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sore throat',
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.w500,
                      fontSize: 25),
                ),
                Checkbox(
                  value: symptomArr[3],
                  onChanged: (value) {
                    setState(() {
                      symptomArr[3] = value;
                    });
                    print(symptomArr);
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Headache',
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.w500,
                      fontSize: 25),
                ),
                Checkbox(
                  value: symptomArr[4],
                  onChanged: (value) {
                    setState(() {
                      symptomArr[4] = value;
                    });
                    print(symptomArr);
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tiredness',
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.w500,
                      fontSize: 25),
                ),
                Checkbox(
                  value: symptomArr[5],
                  onChanged: (value) {
                    setState(() {
                      symptomArr[5] = value;
                    });
                    print(symptomArr);
                  },
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: feverController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Fever',
                ),
              ),
            ),
            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                // ignore: deprecated_member_use
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('Send symptoms'),
                  onPressed: __Send_symptoms__,
                )),
            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                // ignore: deprecated_member_use
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('See daily symptoms'),
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    )
                  },
                )),
          ])), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
