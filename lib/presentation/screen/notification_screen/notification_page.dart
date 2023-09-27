import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:project_vehicle_log/data/repository/notification_repository.dart';
import 'package:project_vehicle_log/presentation/bloc/notification_bloc/notification_bloc.dart';
import 'package:project_vehicle_log/presentation/widget/appbar_widget.dart';
import 'package:project_vehicle_log/support/app_color.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late NotificationBloc notificationBloc;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // notificationBloc = BlocProvider.of(context)
    //   ..add(
    //     GetNotificationAction(
    //       appNotificationRepository: AppNotificationRepository(),
    //     ),
    //   );
    notificationBloc = NotificationBloc();
  }

  final formatter = DateFormat('dd MMMM yyyy, HH:mm:ss');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "Notification",
      ),
      body: BlocBuilder<NotificationBloc, NotificationState>(
        bloc: notificationBloc
          ..add(
            GetNotificationAction(
              appNotificationRepository: AppNotificationRepository(),
            ),
          ),
        builder: (context, state) {
          if (state is NotificationLoading) {
            return Center(
              child: SizedBox(
                height: 50.h,
                width: 50.h,
                child: const CircularProgressIndicator(),
              ),
            );
          }
          if (state is NotificationFailed) {
            return Center(child: Text('terjadi kesalahan ${state.errorMessage}'));
          }
          if (state is NotificationSuccess) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Notification: ${state.getNotificationResponseModel.notification!.length}",
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.getNotificationResponseModel.notification!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: AppColor.blue.withOpacity(0.1),
                          border: Border.all(
                            color: AppColor.blue,
                          ),
                          borderRadius: BorderRadius.circular(12.h),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.notifications,
                                ),
                                SizedBox(width: 12.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.getNotificationResponseModel.notification![index].notificationTitle!,
                                      style: GoogleFonts.inter(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.sp,
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    Text(
                                      state.getNotificationResponseModel.notification![index].notificationDescription!,
                                      style: GoogleFonts.inter(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                formatter.format(state.getNotificationResponseModel.notification![index].updatedAt!),
                                style: GoogleFonts.inter(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 12.h);
                    },
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
