// ignore_for_file: unused_import

import 'dart:io';
import 'dart:ui';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:video_player/video_player.dart';

class Grid extends StatelessWidget {
  List<Map> jsonString = [
    {"file": 'All/all1.jpg', "type": "image"},
    {"file": "All/all2.jpg", "type": "image"},
    {"file": "All/all3.jpg", "type": "image"},
    {"file": "All/all4.jpg", "type": "image"},
    {"file": "All/all5.jpg", "type": "image"},
    {"file": "All/all6.jpg", "type": "image"},
    {"file": "All/all7.jpg", "type": "image"},
    {"file": "All/all8.jpg", "type": "image"},
    {"file": "All/all9.jpg", "type": "image"},
    {"file": "All/all10.jpg", "type": "image"},
    {"file": "All/all11.jpg", "type": "image"},
    {"file": "All/all12.jpg", "type": "image"},
    {"file": "All/all13.jpg", "type": "image"},
    {"file": "All/all14.jpg", "type": "image"},
    {
      "file": "https://cdn.pixabay.com/video/2024/04/19/208630_large.mp4",
      "type": "video"
    },
    {
      "file": "https://cdn.pixabay.com/video/2024/07/28/223551_large.mp4",
      "type": "video"
    },
    {
      "file": "https://cdn.pixabay.com/video/2024/05/31/214732_large.mp4",
      "type": "video"
    },
    {
      "file": "https://cdn.pixabay.com/video/2024/07/26/223253_large.mp4",
      "type": "video"
    },
  ];

  Grid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MasonryGridView.builder(
          itemCount: jsonString.length,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          itemBuilder: (context, index) {
            var allclip = jsonString[index];
            return allclip['type'] == 'image'
                ? Image.file(
                    allclip['file']!,
                    fit: BoxFit.cover,
                  )
                : VideoWidget(
                    VideoURL: allclip['file']!,
                  );
          }),
    );
  }
}

class VideoWidget extends StatefulWidget {
  final String VideoURL;

  const VideoWidget({
    super.key,
    required this.VideoURL,
  });

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;
  late Future _initializeVideoPlayerFuture;

  bool isLiked = false;

  @override
  void initState() {
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.VideoURL),
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.play();
    _controller.setVolume(1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Stack(
          children: [
            FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 30), // Adds margin around the video
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(30), // Border radius
                        child: AspectRatio(
                            aspectRatio: 9 / 16,
                            child: VideoPlayer(_controller)),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            Positioned(
              bottom: 20,
              left: 30,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 25,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Image(
                      image: AssetImage(
                        'icons/soundIcon.png',
                      ),
                      color: Colors.white,
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Photos extends StatelessWidget {
  final List<String> photo = [
    'photos/photo1.jpg',
    'photos/photo2.jpg',
    'photos/photo3.jpg',
    'photos/photo4.jpg',
  ];

  Photos({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: photo.length,
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (context, index) => PositionWidget(
        link: photo[index],
      ),
    );
  }
}

class Posts extends StatelessWidget {
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1),
            itemCount: 4,
            itemBuilder: (context, index) => ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Image.asset('posts/post${index + 1}' '.png'),
                  ),
                )));
  }
}

class PositionWidget extends StatelessWidget {
  final String link;

  const PositionWidget({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Stack(
          children: [
            SizedBox(
              height: 500,
              child: Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(image: AssetImage(link), fit: BoxFit.cover),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 100.0,
                    sigmaY: 100.0,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    width: 170,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Image(
                            image: AssetImage('icons/likeIcon.png'),
                            height: 25,
                            width: 25,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Image(
                            image: AssetImage('icons/messageIcon.png'),
                            height: 25,
                            width: 25,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Image(
                            image: AssetImage('icons/shareIcon.png'),
                            height: 25,
                            width: 25,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String link;

  const VideoPlayerWidget({
    super.key,
    required this.link,
  });

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late Future _initializeVideoPlayerFuture;

  bool isLiked = false;

  @override
  void initState() {
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.link),
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.play();
    _controller.setVolume(1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Stack(
          children: [
            FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 30), // Adds margin around the video
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(30), // Border radius
                        child: AspectRatio(
                            aspectRatio: 9 / 16,
                            child: VideoPlayer(_controller)),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            Positioned(
              bottom: 20,
              right: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 200.0,
                    sigmaY: 200.0,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    width: 170,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isLiked = true;
                            });
                          },
                          icon: Image(
                            image: AssetImage('icons/likeIcon.png'),
                            height: 25,
                            width: 25,
                            color: isLiked ? Colors.pinkAccent : Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Image(
                            image: AssetImage('icons/messageIcon.png'),
                            height: 25,
                            width: 25,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Image(
                            image: AssetImage('icons/shareIcon.png'),
                            height: 25,
                            width: 25,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 30,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 25,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Image(
                      image: AssetImage(
                        'icons/soundIcon.png',
                      ),
                      color: Colors.white,
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
