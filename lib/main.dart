import 'package:animated/page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name = "";
  bool changedButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              obscureText: true,
              onChanged: (value) {
                name = value;
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: "Enter Your Name",
                labelText: "Name",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //animated container start here
            InkWell(
              onTap: () async {
                setState(() {
                  changedButton = true;
                });
                await Future.delayed(
                  Duration(seconds: 1),
                );
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => PageA()));
              },
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                width: changedButton ? 50 : 150,
                height: 50,
                alignment: Alignment.center,
                child: changedButton
                    ? Icon(
                        Icons.done,
                        color: Colors.white,
                      )
                    : Text(
                        'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: changedButton
                      ? BorderRadius.circular(100)
                      : BorderRadius.circular(8),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
