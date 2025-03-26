import 'package:flutter/material.dart';

void main() {
  runApp(BlindMatesApp());
}

class BlindMatesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BlindMates',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    WelcomePage(),
    DevicePage(),
    FindDevicePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.devices), label: "Devices"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Find"),
        ],
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min, // Keeps content centered
        children: [
          Text(
            "Welcome to BlindMates!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            "Smarter Navigation. Greater Independence",
            style: TextStyle(fontSize: 18, color: Colors.grey,fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}

// Device Page
class DevicePage extends StatelessWidget {
  final List<Map<String, dynamic>> devices = [
    {'name': 'Device 1', 'battery': 80, 'image': 'assets/images/device1.jpg'},
    {'name': 'Device 2', 'battery': 50, 'image': ''},
    {'name': 'Device 3', 'battery': 30, 'image': ''},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Devices')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: devices.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(backgroundImage: AssetImage("assets/images/device1.jpg"),),
                  title: Text(devices[index]['name']),
                  subtitle: Text('Battery: ${devices[index]['battery']}%'),
                  trailing: Icon(Icons.battery_3_bar_rounded),
                );
              },
            ),
          ),
          Expanded(
          child: Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {
                // Action to be performed when the button is pressed
              },
              child: Text('Add New Device'),
            ),
          ),
          )  
        ],
        
      )

    );
  }
}

// Find My Device Page
class FindDevicePage extends StatelessWidget {
  void playSound(String deviceName) {
    // Simulate sending signal to device to play sound
    print('$deviceName is ringing!');
  }

  final List<String> devices = ['Device 1', 'Device 2', 'Device 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Find My Device')),
      body: ListView.builder(
        itemCount: devices.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(devices[index]),
            trailing: ElevatedButton(
              onPressed: () => playSound(devices[index]),
              child: Text('Ring'),
            ),
          );
        },
      ),
    );
  }
}