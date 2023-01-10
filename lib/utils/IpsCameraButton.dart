import 'package:flutter/material.dart';

class IpsCameraButton extends StatelessWidget {
  final double size;
  final VoidCallback onPress;
  final Color color;
  final Icon icon;

  IpsCameraButton({
    this.size = 60,
    this.color: Colors.transparent,
   required this.onPress,
   required this.icon,
  });

  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      constraints: BoxConstraints(
        minHeight: size,
        maxHeight: size,
        minWidth: size,
        maxWidth: size,
      ),
      fillColor: color,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.white,
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(size),
        ),
      ),
      child: icon ?? SizedBox.shrink(),
    );
  }
}
