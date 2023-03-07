import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppSecondaryButtonWidget extends StatefulWidget {
  final Function() onPressed;
  final String text;
  final double fontSize;
  final double height;
  final double? width;
  final Color? color;
  final Color? borderColor;
  final double radius;
  final double elevation;

  const AppSecondaryButtonWidget({
    Key? key,
    required this.onPressed,
    required this.text,
    this.fontSize = 16,
    this.height = 40,
    this.width,
    this.color,
    this.borderColor,
    this.radius = 8,
    this.elevation = 0,
  }) : super(key: key);

  @override
  State<AppSecondaryButtonWidget> createState() => _AppSecondaryButtonWidgetState();
}

class _AppSecondaryButtonWidgetState extends State<AppSecondaryButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width ?? MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          primary: widget.color ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            side: BorderSide(
              color: widget.color ?? const Color.fromARGB(255, 17, 124, 163),
            ),
          ),
          shadowColor: Colors.transparent,
          elevation: widget.elevation,
        ),
        child: Text(
          widget.text,
          style: GoogleFonts.poppins(
            color: const Color.fromARGB(255, 17, 124, 163),
            fontSize: widget.fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
