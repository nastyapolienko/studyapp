import 'package:flutter/material.dart';
import 'package:studyapp/timer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("StudyApp")),
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
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => Pomodoro())
                );
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: 'Timer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (int index) => setState((){
          _selectedIndex = index;
          switch(_selectedIndex){
            case 0:
              print("0");
              break;

            case 1:
              print("1");
              break;

          }

        }
      ),
      )
    );
  }
}







