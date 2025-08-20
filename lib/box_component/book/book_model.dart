import 'dart:ui';

class Book {
  final String title;
  final String author;
  final String imageUrl;
  final double rating;
  final String? pdfUrl;
  final Color cardColor;
  final String category;
  final int pages;
   final String synopsis;
    final String price;

  const Book({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.rating,
    this.pdfUrl,
    required this.cardColor,
    required this.category,
    required this.pages,
    required this.synopsis,
    required this.price,
  });
}