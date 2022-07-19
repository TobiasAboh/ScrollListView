// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, unnecessary_this, unnecessary_cast, must_call_super, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, depend_on_referenced_packages, prefer_final_fields
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class ScrollComponent extends StatefulWidget {
  List<Widget> listItems; // list of widgets
  Color backgroundColor; // background color of the widget
  Color color; // color of non active items
  Color activeColor; // color of current active item 
  double minHeight; // min height for each row
  double maxHeight; // max height for each row
  double height; // hieght of the outer container
  ScrollComponent({required this.listItems, this.backgroundColor = Colors.white, this.color = Colors.grey, this.activeColor = Colors.blueGrey, this.height = 200,  this.minHeight = 50, required this.maxHeight});
  
  @override
  State<ScrollComponent> createState() => _ScrollComponentState();
}

class _ScrollComponentState extends State<ScrollComponent> {
  int _focusedIndex = 0;

  void _onFocusedItem(int index){
    setState(() {
      _focusedIndex = index;
    });
  }

  //Widget format for a single row
  Widget _buildListItems(BuildContext context, int index){
    return Container(
          constraints: BoxConstraints(
            minHeight: _focusedIndex == index ? this.widget.minHeight + 30 : this.widget.minHeight,
            maxHeight: this.widget.maxHeight,
          ),
          child: Card(  
            elevation: _focusedIndex == index ? 20 : null,
            color: _focusedIndex == index ? this.widget.activeColor : this.widget.color,
            child: Center(
              heightFactor: 1,
              child: this.widget.listItems[index],)
          ),
        ); 
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: this.widget.backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      width: 500,
      height: this.widget.height,
      child: Padding(
        padding: EdgeInsets.all(6),
        child: Container(
          child: ScrollSnapList(
            scrollDirection: Axis.vertical,
            itemSize: this.widget.minHeight,
            itemCount: this.widget.listItems.length,
            itemBuilder: _buildListItems,
            onItemFocus: _onFocusedItem,))));
  }
}