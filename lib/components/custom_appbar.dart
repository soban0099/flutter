import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/styles.dart';
import 'custom_text_component.dart';

class CustomAppBar extends StatelessWidget {
  Function()? onLeadingPress;
  String? title;
  Widget? trailing;
  bool leading;
  Color bgColor;
  Color? backButtonColor;
  Color? trailingColor;
  Color? titleColor;
  Color? backIconColor;
  bool centerTitle;
  double? elevation;
  Widget? leadingWidget;
  IconThemeData? iconThemeData;

  CustomAppBar({
    Key? key,
    this.title,
    this.elevation = 0,
    this.centerTitle = true,
    this.onLeadingPress,
    this.leading = false,
    this.backIconColor = Styles.white,
    this.bgColor = Styles.black,
    this.trailingColor,
    this.titleColor,
    this.trailing,
    this.leadingWidget,
    this.backButtonColor,
    this.iconThemeData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      backgroundColor: bgColor,
      automaticallyImplyLeading: false,
      centerTitle: centerTitle,
      forceMaterialTransparency: true,
      iconTheme: iconThemeData,
      title: title != null
          ? Padding(
              padding: EdgeInsets.only(
                left: leading == false ? 8 : 0,
              ),
              child: CustomTextWidget(
                text: title.toString(),
                color: titleColor ?? Styles.black,
                textAlign: TextAlign.center,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            )
          : leadingWidget,
      leading: leading == true
          ? IconButton(
              padding: EdgeInsets.zero,
              color: backIconColor,
              onPressed: onLeadingPress ??
                  () {
                    Get.back();
                  },
              icon: Icon(
                Icons.arrow_back_ios,
                color: backButtonColor ?? Styles.white,
               
              ),
            
            )
          : null,
      actions: [
        trailing ?? const SizedBox.shrink(),
       
      ],
    );
  }
}
