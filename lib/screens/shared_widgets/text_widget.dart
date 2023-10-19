import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;

  final TextStyle? style;
  final TextAlign? textAlign;
  final EdgeInsetsGeometry? margin;
  final int? maxLines;
  final bool? softWrap;
  final TextDirection? textDirection;

  const TextWidget(
      {Key? key,
        this.text = "",
        this.style,
        this.softWrap,
        this.textAlign,
        this.margin,
        this.textDirection,
        this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text,
        style: style ??
            const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
        textAlign: textAlign,
        maxLines: maxLines ?? 3,
        softWrap: softWrap,
        overflow: TextOverflow.ellipsis,
        textDirection: textDirection,
      ),
    );
  }
}
