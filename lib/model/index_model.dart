import 'package:flutter/material.dart';

class IndexModel {
  final String image;
  final String title;
  final Color color;

  IndexModel(this.image, this.title, this.color);
}

List<IndexModel> indexModel = [
  IndexModel(
    'assets/images/unsafe.png',
    'Usafe Act',
    Color(0xFFFF8E00),
  ),
  IndexModel(
    'assets/images/uc.png',
    'Unsafe Condition',
    Color(0xFF008FCC),
  ),
  IndexModel(
    'assets/images/near.png',
    'Near Miss',
    Color(0xFF56A027),
  ),
];
