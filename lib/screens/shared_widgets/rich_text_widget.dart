import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class RichTextWidget extends RichText {
  RichTextWidget({
    List<TextSpanWidget>? texts,
    super.key,
    super.maxLines,
    super.overflow,
    super.textAlign,
    super.softWrap,
    super.textDirection,
  }) : super(text: TextSpanWidget(children: texts));
}

class TextSpanWidget extends TextSpan {
  const TextSpanWidget(
      {super.children,
      super.text,
      super.style = const TextStyle(color: black),
      super.recognizer});
}
