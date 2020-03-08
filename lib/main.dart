import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MyBottomNavigationBar(),
    ));

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex;
  Widget _currentPage;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _currentPage = HomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _currentPage,
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                title: Text("Home"), icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                title: Text("Orders"), icon: Icon(Icons.view_list))
          ],
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              switch (_currentIndex) {
                case 0:
                  _currentPage = HomePage();
                  break;
                case 1:
                  _currentPage = OrderPage();
                  break;
              }
            });
          },
        ));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      child: Center(
        child: Text("Home", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
        child: Text(
          "Orders",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
