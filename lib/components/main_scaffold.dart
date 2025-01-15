// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

import 'package:flutter/material.dart';

import '../utils/styles.dart';

class MainScaffold extends StatelessWidget {
  Widget? appBar;
  Color backgroundColor;
  Widget body;
  Widget? bottomNavigationBar;
  Widget? floatingActionButton;
  Widget? bottomSheet;
  bool extendBehindAppBar;
  bool isTopSafeArea;
  Widget? drawer;
  bool isBottomSafeArea;
  GlobalKey<ScaffoldState>? keys;
  @override
  MainScaffold({
    Key? key,
    this.keys,
    this.drawer,
    this.appBar,
    this.backgroundColor = Styles.white,
    this.isTopSafeArea = true,
    required this.body,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.bottomSheet,
    this.extendBehindAppBar = false,
    this.isBottomSafeArea = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: keys,
    
      drawer: drawer, backgroundColor: backgroundColor,
      extendBodyBehindAppBar: extendBehindAppBar,
      floatingActionButton: floatingActionButton,
      bottomSheet: bottomSheet,
      appBar: appBar != null
          ? PreferredSize(
              preferredSize: const Size.fromHeight(35.0), child: appBar!)
          : null,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
