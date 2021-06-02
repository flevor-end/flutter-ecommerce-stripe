// import 'package:flutter/material.dart';
// // import 'package:video_player/video_player.dart';

// class VideoDemo extends StatefulWidget {
//   @override
//   _VideoDemoState createState() => _VideoDemoState();
// }

// class _VideoDemoState extends State<VideoDemo> {
//   // VideoPlayerController _controller;
//   Future<void> _initializeVideoPlayerFuture;

//   @override
//   void initState() {
//     // _controller = VideoPlayerController.network(
//     //   "https://github.com/RandyWei/flt_video_player/blob/master/example/SampleVideo_1280x720_30mb.mp4?raw=true",
//     // );
//     // _controller = VideoPlayerController.asset(
//     //   "video/Keyboard - 1046.mp4",
//     // );
//   //   _initializeVideoPlayerFuture = _controller.initialize();
//   //   _controller.setLooping(true);
//   //   _controller.setVolume(1.0);
//   //   super.initState();
//   // }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _initializeVideoPlayerFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           return AspectRatio(
//             aspectRatio: _controller.value.aspectRatio,
//             child: Stack(
//               children: [
//                 // Positioned.fill(child: VideoPlayer(_controller)),
//                 FlatButton(
//                   onPressed: () {
//                     setState(() {
//                       // Si el vídeo se está reproduciendo, pausalo.
//                       if (_controller.value.isPlaying) {
//                         _controller.pause();
//                       } else {
//                         // Si el vídeo está pausado, reprodúcelo
//                         _controller.play();
//                       }
//                     });
//                   },
//                   child: Align(
//                     child: Icon(
//                       _controller.value.isPlaying
//                           ? Icons.pause
//                           : Icons.play_arrow,
//                       size: 45,
//                       color: Colors.white,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           );
//         } else {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     );
//   }
// }
