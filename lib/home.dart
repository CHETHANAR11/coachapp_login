// import 'package:flutter/material.dart';
// import 'package:login_coachapp/main.dart';
// import 'package:provider/provider.dart';
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 128, 125, 125),
//         title: Text('BounceFitCoach'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () {
//               Provider.of<UserViewModel>(context, listen: false).setUser(User(email: '', password: '')); // Reset user when logging out
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => LoginPage()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: Consumer<UserViewModel>(
//           builder: (context, userViewModel, child) {
//             return Text(
//               'Welcome, ${userViewModel.user?.email ?? 'Guest'}!',
//               style: TextStyle(fontSize: 24),
//             );
//           },
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentIndex,
//         onTap: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.group),
//             label: 'TeamUp',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.sports),
//             label: 'Games',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.timeline),
//             label: 'Progress',
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:login_coachapp/main.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 128, 125, 125),
        title: Text('BounceFitCoach'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Provider.of<UserViewModel>(context, listen: false)
                  .setUser(User(email: '', password: '')); // Reset user when logging out
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Consumer<UserViewModel>(
          builder: (context, userViewModel, child) {
            return Text(
              'Welcome, ${userViewModel.user?.email ?? 'Guest'}!',
              style: TextStyle(fontSize: 24),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'TeamUp',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports),
            label: 'Games',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline),
            label: 'Progress',
          ),
        ],
      ),
    );
  }
}
