import 'package:flutter/material.dart';

class QuoteSection extends StatelessWidget {
  final String currentQuote;
  final VoidCallback onNewQuoteRequested;

  const QuoteSection({
    required this.currentQuote,
    required this.onNewQuoteRequested,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.article, size: 30.0),
              color: Colors.pink,
              onPressed: onNewQuoteRequested,
            ),
            const Text(
              "Press here to get quote",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.pink.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            currentQuote,
            style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
          ),
        ),
      ],
    );
  }
}
