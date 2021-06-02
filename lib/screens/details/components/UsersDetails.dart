// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'dart:convert';


// class UsersDetails extends StatefulWidget {

//   static String routeName = "/UsersDetails";

//   @override
//   _UsersDetailsState createState() => _UsersDetailsState();
// }

// class _UsersDetailsState extends State<UsersDetails> {

//   Map data;
//   List usersData;

//   getUsers() async {
//     http.Response response = await http.get('http://10.0.2.2:4000/api/users');
//     data = json.decode(response.body);
//     setState(() {
//       usersData = data['users'];
//     });
   
//   }

//   @override
//   void initState() {
//     super.initState();
//     getUsers();
//   }

  
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: usersData == null ? 0 : usersData.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Card(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text("$index", style: TextStyle(fontSize: 12.0),),
//                 ),
//                 CircleAvatar(
//                   backgroundImage: NetworkImage(usersData[index]['avatar']),
//                 ),
//                 Padding(padding: const EdgeInsets.all(10.0),
//                 child: Text(
//                   "${usersData[index]["firstName"]} ${usersData[index]["lastName"]}}"
//                 ),
//                 )
//               ],),
//             ),
//           );
//         },
//         ),
      
//     );
//   }
// }