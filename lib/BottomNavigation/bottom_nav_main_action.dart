import 'package:chain_pi/BottomNavigation/bottom_nav_home_page.dart';
import 'package:chain_pi/BottomNavigation/bottom_nav_message_page.dart';
import 'package:flutter/material.dart';

class BottomNavMainAction extends StatefulWidget {
  @override
  _BottomNavMainActionState createState() => _BottomNavMainActionState();
}

class _BottomNavMainActionState extends State<BottomNavMainAction> {
  int _selectedNavigationIndext = 0;
  static List<Widget> _navigations = [
    BottomNavHomePage(),
    BottomNavMessagePage()

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 10),
          child: IconButton(
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
          ),
        ),
        title: Center(child: Text("Chain Pi")),
        backgroundColor: Color.fromRGBO(84, 84, 126, 100),
        actions: <Widget>[
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        ],
      ),
      body: Center(
        child: _navigations.elementAt(_selectedNavigationIndext),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.message),title: Text("Message")),

        ],
        currentIndex: _selectedNavigationIndext,
        selectedItemColor: Colors.blue,
        onTap: _onNavItemTap
      ),
    );
  }
 void  _onNavItemTap(int navindex){
    setState(() {
     _selectedNavigationIndext = navindex;

    });
  }
}
