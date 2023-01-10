import 'package:flutter/material.dart';

class IpsCard extends StatelessWidget {
  final Widget label;
  final Widget value;
  final Widget icon;
  final Widget error;
  final VoidCallback onClick;
  final Color color;
  final OutlinedBorder shape;

  IpsCard({
    required this.label,
    required this.value,
    required this.onClick,
    this.icon=const SizedBox.shrink(),
    this.error=const SizedBox.shrink(),
    this.color =Colors.white,
    this.shape= const RoundedRectangleBorder(
      side: BorderSide(color: Color(0xffD8D8D8), width: 1),
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: this.color ?? Colors.white,
        shape: this.shape,
      ),
      onPressed: onClick,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          this.label,
                          SizedBox(
                            height: 5,
                          ),
                          this.value,
                          this.error
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  this.icon
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
