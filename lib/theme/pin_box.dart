import 'package:flutter/material.dart';

class DigitHolder extends StatelessWidget {
  final int? selectedIndex;
  final int? index;
  final String? code;
  final Color? color;
  const DigitHolder({
    @required this.selectedIndex,
    Key? key,
    @required this.width,
    this.index,
    this.code,
    this.color,
  }) : super(key: key);

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: 50,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Color(0xFF434547),
        ),
      ),
      child: code!.length > index!
          ? Container(
              width: 15,
              height: 15,
              decoration: const BoxDecoration(
                color: Color(0xFF5E5E5F),
                shape: BoxShape.circle,
              ),
            )
          : const SizedBox(),
    );
  }
}
