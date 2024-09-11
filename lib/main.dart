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
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal:15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   const Text('makko',
                   style:TextStyle(
                    fontSize: 60,
                    fontFamily:'HMSGilbertScript',
                   ), ),
                   Image.asset('icons/bellnotificationredIcon.png',
                   height: 40,
                   width: 40,)
                ],
              ),
            ),

          Container(
            child: TabBar(
              labelPadding: const EdgeInsets.all(0),
              tabs: [
              const Tab(child: Text('All'),),
               const Tab(child: Text('Photos'),),
                const Tab(child: Text('Videos'),),
                 const Tab(child: Text('Posts'),),
                 const SizedBox(
                  width: 50,
                 ),
                 Tab(icon:IconButton(
                  onPressed: (){
                   const Drawer(
                    elevation: 16.0,
                    child: Column(
                      children: [
                        Text('Filter')
                      ],
                    ),
                   );
                 },
                  icon: Image.asset('icons/filterIcon.png',
                   height: 25,
                   width: 25,),)),
            ],),
          ),
         Expanded(child: TabBarView(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Grid(),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
             child:Photos(),
            ),
             const VWidget(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Posts(),),
              const FilterWidget()
          ]))
      
          ],
        ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [BottomNavigationBarItem(icon:Image.asset('icons/homeIcon.png',
          height: 30,width: 30,),label:''),
          BottomNavigationBarItem(icon: Image.asset('icons/searchIcon.png',
          height: 30,width: 30,),label: ''),
          BottomNavigationBarItem(icon: Image.asset('icons/plusIcon.png',
          height: 40,width: 40,),label: ''),
          BottomNavigationBarItem(icon: Image.asset('icons/messageIcon.png',
          height: 30,width: 30,),label: ''),
          BottomNavigationBarItem(icon: Image.asset('icons/profileIcon.png',
          height: 30,width: 30,),label: ''),],),
      ),
    );
  }
}

