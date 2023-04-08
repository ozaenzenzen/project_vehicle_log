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
  Color statusColor = Colors.black;
  String statusTitle = "Add";

  void handleStatus(statusLogs) {
    if (statusLogs == StatusLogs.add) {
      statusColor = AppColor.green;
      statusTitle = "Add";
    } else if (statusLogs == StatusLogs.update) {
      statusColor = AppColor.yellow;
      statusTitle = "Update";
    } else {
      statusColor = AppColor.red;
      statusTitle = "Delete";
    }
  }

  @override
  Widget build(BuildContext context) {
    handleStatus(widget.statusLogs);
    if (widget.statusLogs == null) {
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
            Text(
              widget.title!,
              style: AppTheme.theme.textTheme.bodyLarge?.copyWith(
                // color: AppColor.text_4,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
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
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(12.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.title!,
                    style: AppTheme.theme.textTheme.headline3?.copyWith(
                      // color: AppColor.text_4,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    // "(${widget.statusLogs.toString()})",
                    "(${statusTitle.toString()})",
                    style: AppTheme.theme.textTheme.headline6?.copyWith(
                      // color: AppColor.text_4,
                      // color: Colors.black,
                      // color: handleStatusColor(widget.statusLogs),
                      color: statusColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Text(
                "2 days ago",
                style: AppTheme.theme.textTheme.headline6?.copyWith(
                  // color: AppColor.text_4,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.w),
          Row(
            children: [
              Text(
                "New Odo",
                style: AppTheme.theme.textTheme.bodyMedium?.copyWith(
                  // color: AppColor.text_4,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                ":",
                style: AppTheme.theme.textTheme.bodyMedium?.copyWith(
                  // color: AppColor.text_4,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                widget.value!,
                style: AppTheme.theme.textTheme.bodyMedium?.copyWith(
                  // color: AppColor.text_4,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.w),
          Row(
            children: [
              Text(
                "Date Updated",
                style: AppTheme.theme.textTheme.bodyMedium?.copyWith(
                  // color: AppColor.text_4,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                ":",
                style: AppTheme.theme.textTheme.bodyMedium?.copyWith(
                  // color: AppColor.text_4,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                "${DateTime.now()}",
                style: AppTheme.theme.textTheme.bodyMedium?.copyWith(
                  // color: AppColor.text_4,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.w),
          Row(
            children: [
              Text(
                "Amount",
                style: AppTheme.theme.textTheme.bodyMedium?.copyWith(
                  // color: AppColor.text_4,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                ":",
                style: AppTheme.theme.textTheme.bodyMedium?.copyWith(
                  // color: AppColor.text_4,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                widget.value!,
                style: AppTheme.theme.textTheme.bodyMedium?.copyWith(
                  // color: AppColor.text_4,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.w),
          Row(
            children: [
              Text(
                "Notes",
                style: AppTheme.theme.textTheme.bodyMedium?.copyWith(
                  // color: AppColor.text_4,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                ":",
                style: AppTheme.theme.textTheme.bodyMedium?.copyWith(
                  // color: AppColor.text_4,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                  style: AppTheme.theme.textTheme.bodyMedium?.copyWith(
                    // color: AppColor.text_4,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
