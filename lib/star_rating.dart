import 'package:flutter/material.dart';

class StarRatingWidget extends StatefulWidget {
  const StarRatingWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StarRatingWidgetState createState() => _StarRatingWidgetState();
}

class _StarRatingWidgetState extends State<StarRatingWidget> {
  double _rating = 0.0;
  bool _showForm = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 1; i <= 5; i++)
              GestureDetector(
                onTapDown: (details) {
                  setState(() {
                    double rating =
                        i.toDouble() + details.localPosition.dx / 50;
                    _rating = rating.clamp(0.0, 5.0);
                  });
                },
                onHorizontalDragUpdate: (details) {
                  setState(() {
                    double rating =
                        i.toDouble() + details.localPosition.dx / 50;
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
        ),
        const SizedBox(height: 20),
        if (_rating < 5)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showForm = true;
                    });
                  },
                  child: const Text("ОК"),
                ),
                if (_showForm) ...[
                  const SizedBox(height: 20),
                  const Text("Введите дополнительные комментарии:"),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Ваш комментарий",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ],
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
