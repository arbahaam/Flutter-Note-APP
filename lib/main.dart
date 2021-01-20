import 'package:flutter/material.dart';
import 'package:my_note/state/app.state.dart';
import 'package:my_note/view/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<AppState>(
//         create: (BuildContext context) => AppState(),
//         builder: (context, widget) {
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             theme: ThemeData(
//               primaryColor: Color.fromRGBO(4, 9, 21, 1),

//               // primarySwatch: Colors.black38,
//               // visualDensity: VisualDensity.adaptivePlatformDensity,
//             ),
//             home: HomeScreen(),
//           );
//         });
//   }
// }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      create: (context) => AppState()..fetchNotes(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromRGBO(4, 9, 21, 1),

          // primarySwatch: Colors.black38,
          // visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
