
import 'package:flutter/cupertino.dart';

class CenterPositioned extends StatelessWidget{
  final Widget child;
  CenterPositioned({required this.child});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,bottom: 0,left: 0,right: 0,
      child: child,
    );
  }
}