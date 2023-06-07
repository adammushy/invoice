import 'package:invoice/imports.dart';

class TextBuilder extends StatefulWidget {
  final String? text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final double? latterSpacing;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final TextAlign? textAlign;
  final double? height;
  final double? wordSpacing;
  final TextDecoration? textDecoration;
  final FontStyle? fontStyle;
  const TextBuilder({
    Key? key,
    this.text,
    this.fontSize,
    this.color,
    this.textOverflow,
    this.fontWeight,
    this.latterSpacing,
    this.maxLines,
    this.textAlign,
    this.height,
    this.wordSpacing,
    this.textDecoration,
    this.fontStyle,
  }) : super(key: key);

  @override
  State<TextBuilder> createState() => _TextBuilderState();
}

class _TextBuilderState extends State<TextBuilder> {
  @override
  Widget build(BuildContext context) {
    return Text(
      
      widget.text!,
      
      style: GoogleFonts.lato(
        fontSize: widget.fontSize,
        color: widget.color,
        fontWeight: widget.fontWeight,
        letterSpacing: widget.latterSpacing,
        height: widget.height,
        wordSpacing: widget.wordSpacing,
        decoration: widget.textDecoration,
        fontStyle: widget.fontStyle,
      ),
      maxLines: widget.maxLines,
      overflow: widget.textOverflow,
      textAlign: widget.textAlign,
   
    );
  }
}
