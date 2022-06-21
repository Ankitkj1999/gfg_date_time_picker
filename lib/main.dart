import 'package:flutter/material.dart';
import 'package:gfg_test/date_time_picker.dart';
import 'package:gfg_test/time_picker.dart';
import 'date_picker.dart';

// function to trigger the app build
void main() {
  runApp(const TabBarDemo());
}

// class to build the app
class TabBarDemo extends StatelessWidget {
  const TabBarDemo({Key? key}) : super(key: key);

// build the app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            title: Column(
              children: [
                const Text('GeeksForGeeks'),
                const SizedBox(height: 20),
                TabBar(
                  labelColor: Colors.white,
                  indicatorColor: Colors.grey,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50), // Creates border
                      color: const Color.fromARGB(255, 53, 53, 53)),
                  // indicatorSize: TabBarIndicatorSize.label,
                  tabs: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Date Picker'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Time Picker'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Date / Time '),
                    ),
                  ],
                ),
              ],
            ), // TabBar
            // title: const Text('GeeksForGeeks'),
            backgroundColor: Colors.black,
          ), // AppBar
          body: const TabBarView(
            children: [
              TextScreen(),
              TimeScreen(),
              DateTimeScreen(),
            ],
          ), // TabBarView
        ), // Scaffold
      ), // DefaultTabController
    ); // MaterialApp
  }
}
