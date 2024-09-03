//
//
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:swiggy/view/utils/config/app_images.dart';
// import 'Mobile_Screen.dart';
//
// class GetStarted extends StatefulWidget {
//   const GetStarted({super.key});
//
//   @override
//   State<GetStarted> createState() => _GetStartedState();
// }
//
// class _GetStartedState extends State<GetStarted> {
//   late VideoPlayerController _controller;
//   final List<String> _videos = [
//     'assets/video/20dca82cc86b40cbbf2ae647793f1622.mp4',
//     'assets/video/bfb99108c6f4fc7b58a96c6e47dd6abe.mp4',
//     'assets/video/d3659760ae224489c4f0f678cc62b79d.mp4'
//   ];
//   int _currentVideoIndex = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeAndPlay(_videos[_currentVideoIndex]);
//   }
//
//   void _initializeAndPlay(String videoPath) {
//     _controller = VideoPlayerController.asset(videoPath)
//       ..initialize().then((_) {
//         setState(() {}); // Ensure the first frame is shown after the video is initialized
//         _controller.play();
//         _controller.setLooping(false);
//         _controller.addListener(_videoListener);
//       });
//   }
//
//   void _videoListener() {
//     if (_controller.value.position == _controller.value.duration) {
//       setState(() {
//         _currentVideoIndex = (_currentVideoIndex + 1) % _videos.length;
//         _controller.removeListener(_videoListener);
//         _controller.dispose();
//         _initializeAndPlay(_videos[_currentVideoIndex]);
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     _controller.removeListener(_videoListener);
//     _controller.dispose();
//     super.dispose();
//   }
//
//   TextStyle _getTextStyle(int index) {
//     return TextStyle(
//       color: Colors.white,
//       fontSize: 24,
//       fontWeight: _currentVideoIndex == index ? FontWeight.w500 : FontWeight.w300,
//     );
//   }
//
//   double _getTextWidth(int index) {
//     return _currentVideoIndex == index ? 500 : 300;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           _controller.value.isInitialized
//               ? SizedBox(
//             height: size.height,
//             width: size.width,
//             child: FittedBox(
//               fit: BoxFit.cover,
//               child: SizedBox(
//                 width: _controller.value.size.width,
//                 height: _controller.value.size.height,
//                 child: VideoPlayer(_controller),
//               ),
//             ),
//           )
//               : Container(
//             height: size.height,
//             width: size.width,
//             color: Colors.black,
//             child: Center(
//               child: CircularProgressIndicator(),
//             ),
//           ),
//           SizedBox(
//             height: size.height,
//             width: size.width,
//
//             child: Container(
//               margin: const EdgeInsets.only(left: 25, bottom: 25, right: 25),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "Swiggy",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 43,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//                   Row(
//                     children: [
//                       Text(
//                         "Food",
//                         style: _getTextStyle(0),
//                       ),
//                       const SizedBox(width: 15),
//                       const Icon(
//                         Icons.circle,
//                         color: Colors.white,
//                         size: 10,
//                       ),
//                       const SizedBox(width: 15),
//                       Text(
//                         "Instamart",
//                         style: _getTextStyle(1),
//                       ),
//                       const SizedBox(width: 15),
//                       const Icon(
//                         Icons.circle,
//                         color: Colors.white,
//                         size: 10,
//                       ),
//                       const SizedBox(width: 15),
//                       Text(
//                         "Dineout",
//                         style: _getTextStyle(2),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 15),
//                   const Divider(
//                     color: Colors.white,
//                     height: 13,
//                     thickness: 2,
//                   ),
//                   const Text(
//                     "Order from top restaurants",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 24,
//                       fontWeight: FontWeight.w300,
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => MobileNumber()),
//                       );
//                     },
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
//                       fixedSize: MaterialStateProperty.all(const Size(400, 45)),
//                     ),
//                     child: const Text(
//                       "Get Started",
//                       style: TextStyle(fontSize: 20, color: Colors.black),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:swiggy/view/utils/config/app_images.dart';
import 'Mobile_Screen.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> with SingleTickerProviderStateMixin {
  late VideoPlayerController _controller;
  final List<String> _videos = [
    'assets/video/20dca82cc86b40cbbf2ae647793f1622.mp4',
    'assets/video/bfb99108c6f4fc7b58a96c6e47dd6abe.mp4',
    'assets/video/d3659760ae224489c4f0f678cc62b79d.mp4'
  ];
  int _currentVideoIndex = 0;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(_animationController);

    _initializeAndPlay(_videos[_currentVideoIndex]);
  }

  void _initializeAndPlay(String videoPath) {
    _controller = VideoPlayerController.asset(videoPath)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(false);
        _controller.addListener(_videoListener);
      });
  }

  void _videoListener() {
    if (_controller.value.position == _controller.value.duration) {
      _animationController.forward().then((_) {
        setState(() {
          _currentVideoIndex = (_currentVideoIndex + 1) % _videos.length;
          _controller.removeListener(_videoListener);
          _controller.dispose();
          _animationController.reverse();
          _initializeAndPlay(_videos[_currentVideoIndex]);
        });
      });
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_videoListener);
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  TextStyle _getTextStyle(int index) {
    return TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: _currentVideoIndex == index ? FontWeight.w500 : FontWeight.w300,
    );
  }

  double _getTextWidth(int index) {
    return _currentVideoIndex == index ? 500 : 300;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          _controller.value.isInitialized
              ? AnimatedBuilder(
            animation: _fadeAnimation,
            builder: (context, child) {
              return Opacity(
                opacity: _fadeAnimation.value,
                child: SizedBox(
                  height: size.height,
                  width: size.width,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: _controller.value.size.width,
                      height: _controller.value.size.height,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                ),
              );
            },
          )
              : Container(
            height: size.height,
            width: size.width,
            color: Colors.black,

          ),
          SizedBox(
            height: size.height,
            width: size.width,

            child: Container(
              margin: const EdgeInsets.only(left: 25, bottom: 25, right: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Swiggy",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 43,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        "Food",
                        style: _getTextStyle(0),
                      ),
                      const SizedBox(width: 15),
                      const Icon(
                        Icons.circle,
                        color: Colors.white,
                        size: 10,
                      ),
                      const SizedBox(width: 15),
                      Text(
                        "Instamart",
                        style: _getTextStyle(1),
                      ),
                      const SizedBox(width: 15),
                      const Icon(
                        Icons.circle,
                        color: Colors.white,
                        size: 10,
                      ),
                      const SizedBox(width: 15),
                      Text(
                        "Dineout",
                        style: _getTextStyle(2),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Divider(
                    color: Colors.white,
                    height: 13,
                    thickness: 2,
                  ),
                  const Text(
                    "Order from top restaurants",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MobileNumber()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.deepOrange),
                      fixedSize: MaterialStateProperty.all(const Size(400, 45)),
                    ),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
