import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextFieldWidget extends StatefulWidget {
  final String textFieldTitle;
  final String textFieldHintText;
  final int? textFieldMaxLines;
  final TextEditingController? controller;
  final bool readOnly;
  final TextInputType? keyboardType;
  final Function()? onTap;

  const AppTextFieldWidget({
    Key? key,
    required this.textFieldTitle,
    required this.textFieldHintText,
    this.controller,
    this.textFieldMaxLines,
    this.readOnly = false,
    this.onTap,
    this.keyboardType,
  }) : super(key: key);

  @override
  State<AppTextFieldWidget> createState() => _AppTextFieldWidgetState();
}

class _AppTextFieldWidgetState extends State<AppTextFieldWidget> {
  double? height;

  @override
  void initState() {
    // if (widget.textFieldMaxLines != null) {
    //   height = null;
    // } else {
    //   height = 48.h;
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(height: 16.h),
        Text(
          // "Email",
          widget.textFieldTitle,
          style: GoogleFonts.inter(
            color: const Color(0xff331814),
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 4.h),
        SizedBox(
          // height: 48.h,
          height: height,
          child: TextField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            // maxLines: 5,
            maxLines: widget.textFieldMaxLines,
            // minLines: 1,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.h),
              // hintText: "jane29@gmail.com",
              hintText: widget.textFieldHintText,
              hintStyle: GoogleFonts.inter(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff7F848F),
                ),
              ),
            ),
            readOnly: widget.readOnly,
            onTap: widget.onTap,
          ),
        ),
      ],
    );
  }
}
