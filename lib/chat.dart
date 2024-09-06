import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(const grid());
}

class grid extends StatelessWidget {
  const grid({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MasonryGridView.builder(
        itemCount: 6,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
       itemBuilder:(context, index)=> ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
           child:Image.asset('images/images${index+1}''.jpg',),
       ),
       ),  
       );
  }
}


class photos extends StatelessWidget {
  const photos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1),
        itemCount: 1,
        padding: const EdgeInsets.all(8.0),
         itemBuilder: (context, index)=>
         const positioned()
         ),
    );
  }
}

class posts extends StatelessWidget {
  const posts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1),
        itemCount: 4,
         itemBuilder: (context, index)=>ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Image.asset('posts/post${index+1}''.png'),
          ),
         ))
    );
  }
}

class positioned extends StatelessWidget {
  const positioned({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Stack(
            children: [
                 ClipRRect(
                 borderRadius: BorderRadius.circular(15),
                  child: const Image(image: AssetImage('photos/photo1.jpg'),
                   height: 500,
                   width: 300,
                   fit: BoxFit.fill,),
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
                            width: 100,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                            Image(image: AssetImage('icons/likeIcon.png'),
                            height: 25,
                            width: 25,
                            color: Colors.white,),
                            Image(image: AssetImage('icons/messageIcon.png'),
                            height: 25,
                            width: 25,
                            color: Colors.white,),
                            Image(image: AssetImage('icons/shareIcon.png'),
                            height: 25,
                            width: 25,
                            color: Colors.white,),
                            ],
                            ),
                          ),
                        ),
                      ),
                    ),
                     Positioned(
                      bottom: 20,
                      left: 20,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 100.0,
                            sigmaY: 100.0,
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(4.0),
                            child: const Image(image: AssetImage('icons/soundIcon.png',),
                            color: Colors.white,
                            height: 20,
                            width: 20,),
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