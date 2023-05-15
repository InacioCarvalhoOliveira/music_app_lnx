import 'package:flutter/material.dart';
import 'package:music_ap_lnx/core/app/music_app_text_styles.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  const TextWidget(this.text, {this.style, this.textAlign, super.key});

  TextWidget.bold(this.text, {super.key, TextStyle? textStyle, this.textAlign})
      : style = textStyle ?? MusicAppTextStyles.getNormalBoldStyle;

  TextWidget.title(this.text, {super.key, TextStyle? textStyle, this.textAlign})
      : style = textStyle ?? MusicAppTextStyles.getNormalBoldStyle;

  TextWidget.normal(this.text, {super.key, TextStyle? textStyle, this.textAlign})
      : style = textStyle ?? MusicAppTextStyles.getNormalBoldStyle;

  TextWidget.small(this.text, {super.key, TextStyle? textStyle, this.textAlign})
      : style = textStyle ?? MusicAppTextStyles.getSmalltype;

  @override
  Widget build(BuildContext context) {
    return Text(text, style:style,textAlign: textAlign,);
  }
}
