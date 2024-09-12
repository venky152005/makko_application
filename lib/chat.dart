// ignore_for_file: unused_import

import 'dart:io';
import 'dart:ui';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:video_player/video_player.dart';

class Grid extends StatelessWidget {
  final List<String> images = [
    'All/all1.jpg',
    'All/all2.png',
    'All/all3.jpg',
    'All/all4.jpg',
    'All/all5.png',
    'All/all6.jpg',
    'All/all7.jpg',
    'All/all8.png',
    'All/all9.jpg',
    'All/all10.jpg',
    'All/all11.png',
    'All/all12.jpg',
    'All/all13.jpg',
    'All/all14.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MasonryGridView.builder(
          itemCount: images.length,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(images[index]), //images[0]
              )),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemCount: photo.length,
        padding: const EdgeInsets.all(8.0),
        itemBuilder: (context, index) => PositionWidget(
          link: photo[index],
        ),
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
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image(
                    image: AssetImage(link),
                    height: 500,
                    width: 300,
                    fit: BoxFit.fill),
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
      ),
    );
  }
}

class VWidget extends StatefulWidget {
  final String link;

  const VWidget({
    super.key,
    required this.link,
  });

  @override
  State<VWidget> createState() => _VWidgetState();
}

class _VWidgetState extends State<VWidget> {
  late VideoPlayerController _controller;
  late Future _initializeVideoPlayerFuture;

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
    return Scaffold(
      body: Center(
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
      ),
    );
  }
}
