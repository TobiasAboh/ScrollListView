// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

import 'my_scroll_component.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String title;
  MyHomePage({required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();
  // ignore: prefer_const_constructors
  List<Widget> listElements = [Text("ITEM 1"), Text("ITEM 2"), Text("ITEM 3"), Text("ITEM 4"), Text("ITEM 5"), Text("ITEM 6")];
  

  void refresh(){
    setState((){});
  }

  @override
  void initState(){
    _scrollController.addListener(refresh);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.title),
      ),
      body: Center(
        child: ScrollComponent(
        controller: _scrollController,
        listItems: listElements,
        maxHeight: MediaQuery.of(context).size.height,
      ),
      
    ));
  }
}
