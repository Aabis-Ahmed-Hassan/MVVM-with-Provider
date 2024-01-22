import 'package:flutter/material.dart';
import 'package:mvvm_with_provider/res/Colors.dart';

class RoundButton extends StatelessWidget {
  RoundButton({
    super.key,
    required this.title,
    this.loading = false,
    required this.onPress,
  });

  String title;
  bool loading;
  VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 50,
        width: 250,
        decoration: BoxDecoration(
          color: AppColors.defaultColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: loading
              ? CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
        ),
      ),
    );
  }
}
