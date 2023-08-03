import 'package:flutter/material.dart';

class StarRatingWidget extends StatefulWidget {
  @override
  _StarRatingWidgetState createState() => _StarRatingWidgetState();
}

class _StarRatingWidgetState extends State<StarRatingWidget> {
  double _rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 1; i <= 5; i++)
          GestureDetector(
            onTap: () {
              setState(() {
                if (_rating == i - 0.5) {
                  _rating = i.toDouble();
                } else {
                  _rating = i - 0.5;
                }
              });
            },
            onHorizontalDragUpdate: (details) {
              setState(() {
                double rating = i.toDouble() + details.localPosition.dx / 50;
                _rating = rating.clamp(0.0, 5.0);
              });
            },
            child: Image.asset(
              _getStarImage(i),
              width: 40,
              height: 40,
            ),
          ),
      ],
    );
  }

  String _getStarImage(int index) {
    if (_rating >= index) {
      return 'assets/full_star.jpg';
    } else if (_rating >= index - 0.5) {
      return 'assets/half_star.jpg';
    } else {
      return 'assets/empty_star.jpg';
    }
  }
}
