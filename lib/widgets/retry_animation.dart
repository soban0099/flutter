import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:trendingapp/components/custom_button_component.dart';
import 'package:trendingapp/utils/styles.dart';

class RetryAnimation extends StatelessWidget {
  final VoidCallback onRetry;

  const RetryAnimation({required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/lottie/retry.json', width: 200, height: 200),
          SizedBox(
            height: 20,
          ),

          
          Text("Something went wrong..",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: Colors.black, 
              )),
          SizedBox(
            height: 10,
          ),
          Text("An alien is probably blocking your signal",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: Colors.grey, // Customize as needed
              )),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
            child: CustomButton(
                onTap: onRetry,
                borderColor: Styles.greenColor,
                height: 50,
                radius: 5,
                title: "Retry",
                bgColor: Colors.transparent,
                fontColor: Styles.greenColor),
          ),
        ],
      ),
    );
  }
}
