import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum ImageSize { oneX, twoX, threeX }

class Styles {
  static const greenColor = Color(0xFF6BA814);

  static const white = Color(0xFFFFFFFF);

  static const black = Colors.black;

  static const grey = Color(0xFFD9D9D9);

  static const double screenPadding = 24;

  static int calculateTimeDifference(DateTime dateTime) {
    final DateTime now = DateTime.now();
    final Duration difference = dateTime.difference(now);
    return difference.inSeconds.abs();
  }

  static String formatDateTime(DateTime dateTime) {
    final int timeDifferenceInSeconds = calculateTimeDifference(dateTime);

    if (timeDifferenceInSeconds <= 120) {
      // If within 2 minutes, return "Just now"
      return "Just now";
    } else if (timeDifferenceInSeconds < 86400) {
      // If within 24 hours (but more than 2 minutes), return the relative time like "X minutes ago" or "X hours ago"
      if (timeDifferenceInSeconds < 3600) {
        // Less than 1 hour, return "X minutes ago"
        final int minutesAgo = (timeDifferenceInSeconds / 60).floor();
        return "$minutesAgo mins ago";
      } else {
        // 1 hour or more, return "X hours ago"
        final int hoursAgo = (timeDifferenceInSeconds / 3600).floor();
        return "$hoursAgo hours ago";
      }
    } else {
      // If more than 24 hours, return the formatted date-time
      final DateFormat formatter = DateFormat('MMM dd, yyyy hh:mm a');
      final String formattedDateTime = formatter.format(dateTime);
      return formattedDateTime;
    }
  }

  static getIconImage(String imageName, {ImageSize size = ImageSize.oneX}) {
    switch (size) {
      case ImageSize.oneX:
        return "assets/images/icons/$imageName";
      case ImageSize.twoX:
        return "assets/images/icons/$imageName";
      case ImageSize.threeX:
        return "assets/images/icons/$imageName";
    }
  }

  static getLogoImage(String imageName, {ImageSize size = ImageSize.oneX}) {
    switch (size) {
      case ImageSize.oneX:
        return "assets/lottie/$imageName";
      case ImageSize.twoX:
        return "assets/lottie/2.0.x/$imageName";
      case ImageSize.threeX:
        return "assets/lottie/3.0.x/$imageName";
    }
  }
}
