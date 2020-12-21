import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'StudyApp';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child:
        Text('This app is very useful for studying!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
        )
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 130.0,
              child: DrawerHeader(
                child: Text('Menu', textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 30,
                    foreground: Paint()
                      ..style = PaintingStyle.fill
                      ..strokeWidth = 1
                      ..color = Colors.white70,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.all_inclusive ),
              title: Text('My schedule'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.accessibility_new),
              title: Text('Tutors'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.alarm),
              title: Text('Planned activities'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.alarm),
              title: Text('Pomodoro Timer'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}







