import 'package:flutter/material.dart';

extension StringExtension on dynamic {
  Widget text({
    TextStyle? style,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
  }) {
    return Text(
      toString(),
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

extension PaddingExtension on Widget {
  Widget pad({double padding = 8}) {
    return Padding(padding: EdgeInsets.all(padding), child: this);
  }
}
