import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_vehicle_log/data/dummy_data.dart';
import 'package:project_vehicle_log/data/vehicle_data_model.dart';
import 'package:project_vehicle_log/presentation/widget/app_container_box_widget.dart';
import 'package:project_vehicle_log/support/app_color.dart';
import 'package:project_vehicle_log/support/app_theme.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  String? dropDownValue = DummyData.dummyData.first.vehicleName;
  // VehicleDataModel dropDownValue = DummyData.dummyData.first;
  int indexChosen = 0;

  FocusNode dropDownFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        dropDownFocusNode.unfocus();
      },
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              Text(
                "Stats",
                style: AppTheme.theme.textTheme.headline1?.copyWith(
                  // color: AppColor.text_4,
                  color: Colors.black38,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Show stats based on your vehicle",
                style: AppTheme.theme.textTheme.headline5?.copyWith(
                  // color: AppColor.text_4,
                  color: Colors.black38,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20.h),
              DropdownButtonFormField<String>(
                focusNode: dropDownFocusNode,
                items: DummyData.dummyData.map((VehicleDataModel e) {
                  return DropdownMenuItem(
                    value: e.vehicleName,
                    child: Text(
                      "${e.vehicleName}",
                      style: AppTheme.theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    dropDownValue = value!;
                  });
                  dropDownFocusNode.unfocus();
                },
                value: dropDownValue,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              ListView.separated(
                padding: EdgeInsets.symmetric(
                  vertical: 20.h,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: DummyData
                    .dummyData[DummyData.dummyData.indexWhere((element) {
                  return element.vehicleName == dropDownValue;
                })]
                    .listControl!
                    .length,
                itemBuilder: (context, index) {
                  return AppContainerBoxWidget(
                    height: 200.h,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.water_drop,
                            size: 90.h,
                            color: AppColor.primary,
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            // "Oil",
                            DummyData
                                .dummyData[DummyData.dummyData.indexWhere((element) {
                              return element.vehicleName == dropDownValue;
                            })]
                                .listControl![index],
                            style: AppTheme.theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      // child: Text(
                      //   DummyData.dummyData[0].listControl![index],
                      //   style: AppTheme.theme.textTheme.headline5?.copyWith(
                      //     // color: AppColor.text_4,
                      //     color: Colors.black38,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20.h);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
