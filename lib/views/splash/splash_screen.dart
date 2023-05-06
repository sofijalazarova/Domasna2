import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homework2/views/home.dart';

// class SplashScreen extends StatelessWidget {

//   static const String routeName = '/splash';

//   static Route route() {
//     return MaterialPageRoute(
//       settings: RouteSettings(name: routeName),
//       builder: (context) => SplashScreen(),
//     );
//   }


//   @override
//   Widget build(BuildContext context) {

//     // return Scaffold(
//     //     body: Column(
//     //       mainAxisAlignment: MainAxisAlignment.center,
//     //       children: [
//     //         Center(
//     //           child: Image(
//     //             image: AssetImage('assets/images/back.png'),
//     //           ),
//     //         ),
            
//     //       ],
//     //     ),    
//     //   );

//     return Scaffold(
//   body: Stack(
//     children: [
//       Positioned.fill(
//         child: Image(
//           image: AssetImage('assets/images/back.png'),
//           fit: BoxFit.cover,
//         ),
//       ),
//       Positioned(
//         bottom: 50,
//         left: 0,
//         right: 0,
//         child: Center(
//           child: TextButton(
//             onPressed: () {
//                Navigator.of(context).pushNamed('/');
//             },
//             child: Text('Click me!'),
//           ),
//         ),
//       ),
//     ],
//   ),
// );

//   }
// }


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const routeName = '/splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    //Wait for 2 seconds and then navigate to the home page
    // Future.delayed(const Duration(seconds: 2), () {
    //   Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    // });

   }

//   @override
//   Widget build(BuildContext context) {
//         return Scaffold(
//   body: Stack(
//     children: [
//       Positioned.fill(
//         child: Image(
//           image: AssetImage('assets/images/back.png'),
//           fit: BoxFit.cover,
//         ),
//       ),
//       Positioned(
//         bottom: 50,
//         left: 0,
//         right: 0,
//         child: Center(
//           child: TextButton(
//             onPressed: () {
//                Navigator.of(context).pushNamed('/');
//             },
//             child: Text('Click me!'),
//           ),
//         ),
//       ),
//     ],
//   ),
// );
//   }


// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Stack(
//       children: [
//         const Positioned.fill(
//           child: Image(
//             image: AssetImage('assets/images/back.png'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         const Center(
//           child: Image(
//             image: AssetImage('assets/images/logo.png'),
//             width: 170, 
//             height: 170, 
//           ),
//         ),
//         Positioned(
//           bottom: 50,
//           left: 0,
//           right: 0,
//           child: Center(
//             child: TextButton(
//               onPressed: () {
//                 Navigator.of(context).pushNamed('/');
//               },
//              child: Container(
//               width: 200,
//               height: 50,
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFE1D0BF), 
//                 borderRadius: BorderRadius.circular(10), 
//               ),
//                child: const Center(
//                  child: Text(
//                     'GET STARTED',
//                      style: TextStyle(
//                      color: Colors.black,
//                      fontSize: 25, 
//                      fontWeight: FontWeight.bold, 
//                      backgroundColor: Color(0xFFE1D0BF), 
//                  ),
//                   ),
//                ),
//              ),

//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Stack(
      children: [
        const Positioned.fill(
          child: Image(
            image: AssetImage('assets/images/back.png'),
            fit: BoxFit.cover,
          ),
        ),
        const Center(
          child: Image(
            image: AssetImage('assets/images/logo.png'),
            width: 170, 
            height: 170, 
          ),
        ),
        Positioned(
          bottom: 50,
          left: 0,
          right: 0,
          child: Center(
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
             child: Container(
              width: 200,
              height: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFE1D0BF), 
                borderRadius: BorderRadius.circular(10), 
              ),
               child: const Center(
                 child: Text(
                    'GET STARTED',
                     style: TextStyle(
                     color: Colors.black,
                     fontSize: 25, 
                     fontWeight: FontWeight.bold, 
                     backgroundColor: Color(0xFFE1D0BF), 
                 ),
                  ),
               ),
             ),

            ),
          ),
        ),
      ],
    ),
  );
}


}
