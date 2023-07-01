import 'package:flutter/material.dart';

class  RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon,required this.onPressed});
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0,
      child: Icon(icon),
      onPressed:onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: //RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      CircleBorder(),
      fillColor: Color(0xff4c4f5e),
    );
  }
}