// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:masdamas/components/video_demo.dart';
// import 'package:masdamas/constants.dart';

// class CarouselSliderProducts extends StatefulWidget {
//   @override
//   _CarouselSliderProductsState createState() => _CarouselSliderProductsState();
// }

// int _currentIndex = 0;

// List cardList = [
//   Item1(),
//   Item2(),
//   Item3(),
//   Item4(),
// ];

// class _CarouselSliderProductsState extends State<CarouselSlider> {
//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider(
//       options: CarouselOptions(
//           height: 400.0,
//           onPageChanged: (index, reason) {
//             setState(() {
//               _currentIndex = index;
//             });
//           }),
//       items: cardList.map((card) {
//         return Builder(
//           builder: (BuildContext context) {
//             return Container(
//                 width: MediaQuery.of(context).size.width,
//                 margin: EdgeInsets.symmetric(horizontal: 5.0),
//                 decoration: BoxDecoration(color: Colors.amber),
//                 child: Card(
//                   color: kPrimaryLightColor,
//                   child: card,
//                 ));
//           },
//         );
//       }).toList(),
//     );
//   }
// }

// class Item1 extends StatelessWidget {
//   const Item1({Key key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             stops: [
//               0.3,
//               1
//             ],
//             colors: [
//               Color(0xffff4000),
//               Color(0xffffcc66),
//             ]),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           VideoDemo(),
//         ],
//       ),
//     );
//   }
// }

// class Item2 extends StatelessWidget {
//   const Item2({Key key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             stops: [
//               0.3,
//               1
//             ],
//             colors: [
//               Color(0xffff3f3f3),
//               Color(0xffff7f7f7),
//             ]),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Image.asset(
//             'assets/images/ps4_console_blue_1.png',
//             height: 180.0,
//             fit: BoxFit.cover,
//           )
//         ],
//       ),
//     );
//   }
// }

// class Item3 extends StatelessWidget {
//   const Item3({Key key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             stops: [
//               0.3,
//               1
//             ],
//             colors: [
//               Color(0xffff3f3f3),
//               Color(0xffff7f7f7),
//             ]),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Image.asset(
//             'assets/images/ps4_console_blue_2.png',
//             height: 180.0,
//             fit: BoxFit.cover,
//           )
//         ],
//       ),
//     );
//   }
// }

// class Item4 extends StatelessWidget {
//   const Item4({Key key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             stops: [
//               0.3,
//               1
//             ],
//             colors: [
//               Color(0xffff3f3f3),
//               Color(0xffff7f7f7),
//             ]),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Image.asset(
//             'assets/images/ps4_console_blue_3.png',
//             height: 180.0,
//             fit: BoxFit.cover,
//           )
//         ],
//       ),
//     );
//   }
// }
