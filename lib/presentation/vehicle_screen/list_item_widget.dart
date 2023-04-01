import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_vehicle_log/presentation/vehicle_screen/detail_vehicle_page.dart';
import 'package:project_vehicle_log/support/app_color.dart';
import 'package:project_vehicle_log/support/app_theme.dart';

class ItemListWidget extends StatefulWidget {
  final String? title;
  final StatusLogs? statusLogs;
  final String? value;

  const ItemListWidget({
    Key? key,
    required this.title,
    required this.value,
  })  : statusLogs = null,
        super(key: key);

  const ItemListWidget.logs({
    Key? key,
    required this.title,
    required this.statusLogs,
    required this.value,
  }) : super(key: key);

  @override
  State<ItemListWidget> createState() => _ItemListWidgetState();
}

class _ItemListWidgetState extends State<ItemListWidget> {
  Color handleStatusColor(statusLogs) {
    if (statusLogs == StatusLogs.add) {
      return AppColor.green;
    } else if (statusLogs == StatusLogs.update) {
      return AppColor.yellow;
    } else {
      return AppColor.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      decoration: BoxDecoration(
        color: AppColor.border,
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (widget.statusLogs == null)
              ? Text(
                  widget.title!,
                  style: AppTheme.theme.textTheme.bodyLarge?.copyWith(
                    // color: AppColor.text_4,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.title!,
                      style: AppTheme.theme.textTheme.bodyLarge?.copyWith(
                        // color: AppColor.text_4,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      "(${widget.statusLogs.toString()})",
                      style: AppTheme.theme.textTheme.bodySmall?.copyWith(
                        // color: AppColor.text_4,
                        // color: Colors.black,
                        color: handleStatusColor(widget.statusLogs),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
          Text(
            widget.value!,
            style: AppTheme.theme.textTheme.bodyLarge?.copyWith(
              // color: AppColor.text_4,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
