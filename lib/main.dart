// ignore_for_file: unused_import, unnecessary_import, camel_case_types, depend_on_referenced_packages

import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staggered_view/chat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '',),
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
      body: SafeArea(
        child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal:15.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text('makko',
                 style:TextStyle(
                  fontSize: 60,
                  fontFamily:'HMSGilbertScript',
                 ), ),
                 Icon(Icons.notifications_active_outlined)
              ],
            ),
          ),
        const SizedBox(
          height: 25,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('All'),
              Text('Photos'),
              Text('Videos'),
              Text('Post'),
              Icon(Icons.filter_2_outlined),

            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),       
           const Expanded(
            child: grid()
            )
        ],
      ),
      ),
    );
  }
}
