
import 'package:flutter/material.dart';

class RoundedButton extends RawMaterialButton {
  RoundedButton(
      {
        required ShapeStyle style,
        required VoidCallback? onPressed,
        required String title,
        Color? fillColor,
        double? elevation,
        double? height
      }
  ) : super(
      onPressed: onPressed,
      elevation: elevation ?? 3,
      shape: style == ShapeStyle.CIRCLE ? StadiumBorder() : RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      fillColor: fillColor ?? Colors.orangeAccent,
      child: Container(
        child: Center(
            child: Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.white)
            )
        ),
        height: height ?? 38,
      )
  );
}

enum ShapeStyle {
  CIRCLE,
  SQUARE
}