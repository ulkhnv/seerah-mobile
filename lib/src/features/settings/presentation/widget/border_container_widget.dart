import 'package:flutter/material.dart';

class BorderContainer extends StatelessWidget {
  final Widget child;
  final double padding;

  const BorderContainer({super.key, required this.child, this.padding = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: Colors.grey.withOpacity(0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: child,
    );
  }
}
