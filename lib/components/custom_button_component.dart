// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomButton extends StatelessWidget {
  void Function()? onTap;
  String? title;
  double? fontSize;
  double radius;
  double? height;
  double? width;
  bool? underLine;
  FontWeight? fontWeight;
  Color? fontColor;
  Color? decorationColor;
  Color? bgColor;
  Widget? icon;
  Widget? iconRight;
  bool isIcon;
  bool isIconRight;
  Gradient? gradient;
  Color? borderColor;
  double? borderWidth;
  EdgeInsetsGeometry? padding;
  CustomButton({
    Key? key,
    this.onTap,
    this.title,
    this.borderColor,
    this.borderWidth,
    this.decorationColor,
    this.fontSize = 16,
    this.radius = 9,
    this.height = 48.75,
    this.width = 375,
    this.underLine = false,
    this.fontWeight = FontWeight.normal,
    this.fontColor = Styles.black,
    this.bgColor = Styles.black,
    this.icon,
    this.gradient,
    this.isIcon = false,
    this.isIconRight = false,
    this.iconRight,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: bgColor,
          border: borderColor != null
              ? Border.all(width: borderWidth ?? 1, color: borderColor!)
              : null,
          gradient: gradient,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: isIconRight == true
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
            
              Text(
                title.toString(),
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    color: fontColor,
                    decoration: underLine!
                        ? TextDecoration.underline
                        : TextDecoration.none,
                    decorationColor: decorationColor != null
                        ? decorationColor
                        : Styles.black),
              ),
              isIconRight ? const SizedBox(width: 6) : const SizedBox(),
              iconRight ?? const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
