// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, unnecessary_this, unnecessary_cast
import 'package:flutter/material.dart';


class ScrollComponent extends StatefulWidget {
  List<Widget> listItems;
  Color color;
  double minHeight;
  double maxHeight;
  ScrollController controller;
  ScrollComponent({required this.listItems, this.color = Colors.grey, this.minHeight = 50, required this.maxHeight, required this.controller});
  
  @override
  State<ScrollComponent> createState() => _ScrollComponentState();
}

class _ScrollComponentState extends State<ScrollComponent> {
  GlobalKey widgetKey = GlobalKey();
  List<GlobalKey> keys = [];
  Size? cardSize;
  void getKeys(){
    for(int i = 0; i < widget.listItems.length; i++){
      keys.add(GlobalKey());
    }
  }

  
  int selectedElementWidget = 0;
  @override
  Widget build(BuildContext context) {
    getKeys();

    bool isActive(i){
      RenderObject? bigBox = widgetKey.currentContext?.findRenderObject();
      RenderObject? box =  keys[i].currentContext?.findRenderObject();
      if(box != null){
        final double yPosition = (box as RenderBox).localToGlobal(Offset.zero).dy;
        final double parentYPosition = (bigBox as RenderBox).localToGlobal(Offset.zero).dy;

        return (yPosition - parentYPosition) >= 0 && (yPosition - parentYPosition) <= 10;
      }
      return false;
    }
    return Container(
      height: 400,
      color: Colors.black,
    child: Center(child: Container(
      key: widgetKey,
      width: 500,
      height: 50,
      color: Colors.grey,
      child: ListView.builder(
      itemExtent: this.widget.minHeight,
      controller: widget.controller,
      itemCount: this.widget.listItems.length,
      itemBuilder: (context, index){
      return Container(
        constraints: BoxConstraints(
          // minHeight: this.widget.minHeight,
          maxHeight: this.widget.maxHeight,
        ),
        child: Card(
          
          key: keys[index],
          color: isActive(index) ? Colors.blue : this.widget.color,
          child: this.widget.listItems[index],
        ),
      );
    }))));
    
    
    // CupertinoPicker(
    //   onSelectedItemChanged: (value) {
    //     selectedElementWidget = value;
    //   },
    //   // backgroundColor: Colors.grey,
    //   itemExtent: 30,
    //   children: this.widget.listItems,
    // ) ;
    // 
  }
}