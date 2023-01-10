import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../utils/colors.dart';

class IpsPhoto extends StatelessWidget {
  final File file;
  final VoidCallback onClick;
  final double radius;
  final bool readOnly;

  IpsPhoto({
    this.radius: 10,
    required this.onClick,
    required this.file,
    this.readOnly: false,
  });

  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            right: readOnly ? 0 : 15,
            bottom: readOnly ? 0 : 15,
          ),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: IpsColors.light,
                border: Border.all(color: IpsColors.border, width: 1),
                borderRadius: BorderRadius.circular(10),
                image: file != null
                    ? DecorationImage(
                  image: FileImage(file),
                  fit: BoxFit.cover,
                )
                    : null,
              ),
              alignment: Alignment.center,
              child: Visibility(
                visible: file == null,
                child: Icon(
                  FeatherIcons.instagram,
                  size: 26,
                  color: IpsColors.border,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: readOnly == false,
          child: Positioned(
            right: -5,
            bottom: -5,
            child: RawMaterialButton(
              onPressed: onClick,
              fillColor: IpsColors.dark,
              shape: CircleBorder(),
              constraints: BoxConstraints(
                minWidth: 30,
                maxWidth: 30,
                minHeight: 30,
                maxHeight: 30,
              ),
              child: Icon(
                file != null ? FeatherIcons.instagram : FeatherIcons.plus,
                size: 14,
                color: IpsColors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}