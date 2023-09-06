import 'package:flutter/material.dart';
import 'package:peaceworc_agency/ui/DashBoardScreen.dart';
import 'package:peaceworc_agency/ui/NotificationListScreen.dart';
import 'package:peaceworc_agency/ui/ProfileScreen.dart';
import 'package:peaceworc_agency/ui/SettingsScreen.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0;
  final List<Widget> pages = [
     DashBoardScreen(),
     ProfileScreen(),
     NotificationListScreen(),
     SettingsScreen(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = DashBoardScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add, color: Colors.white,),
          backgroundColor: Colors.black,
          shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Container(
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: MaterialButton(
                  minWidth: 40,
                  onPressed: (){
                    setState(() {
                      currentScreen = DashBoardScreen();
                      currentTab = 0;
                    });
                  },
                  child: Icon(
                    Icons.dashboard,
                    color: currentTab == 0 ? Colors.black : Colors.grey[600],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  minWidth: 40,
                  onPressed: (){
                    setState(() {
                      currentScreen = ProfileScreen();
                      currentTab = 1;
                    });
                  },
                  child: Icon(
                    Icons.person,
                    color: currentTab == 1 ? Colors.black : Colors.grey[600],
                  ),
                ),
              ),
              SizedBox(width: 60,),
              Expanded(
                child: MaterialButton(
                  minWidth: 40,
                  onPressed: (){
                    setState(() {
                      currentScreen = NotificationListScreen();
                      currentTab = 2;
                    });
                  },
                  child: Icon(
                    Icons.notifications,
                    color: currentTab == 2 ? Colors.black : Colors.grey[600],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  minWidth: 40,
                  onPressed: (){
                    setState(() {
                      currentScreen = SettingsScreen();
                      currentTab = 3;
                    });
                  },
                  child: Icon(
                    Icons.settings,
                    color: currentTab == 3 ? Colors.black : Colors.grey[600],
                  ),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
