import 'package:chat_phi/core/app_assets.dart';
import 'package:chat_phi/core/app_colors.dart';
import 'package:chat_phi/core/text_styles.dart';
import 'package:chat_phi/widgets/app_text.dart';
import 'package:chat_phi/widgets/edit_form_widget.dart';
import 'package:chat_phi/widgets/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});
  static const route = "/contactView";
  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    List<String> tabs = ["Contacts", "Groups"];
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(1.sw, 126.h),
          child: Container(
            padding: EdgeInsets.fromLTRB(20.w, 30.h, 20.w, 10.h),
            color: Pallet.black,
            child: SafeArea(
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    radius: 14.w,
                    customBorder: CircleBorder(),
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Pallet.white,
                      size: 16.sp,
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  AppText.headlineMedium("Contacts", color: Pallet.white)
                ],
              ),
            ),
          )),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            SizedBox(
              height: 26.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: EditFormOutlinedField(
                hint: "Search",
                prefixWidget: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: ImageLoader(
                    height: 17.w,
                    width: 17.w,
                    path: AppAssets.search,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            TabBar(
                onTap: (index) {
                  selected = index;
                  setState(() {});
                },
                isScrollable: true,
                dividerHeight: 1.w,
                tabAlignment: TabAlignment.start,
                dividerColor: Color(0xffEBEDF8),
                labelStyle: bodyMedium.copyWith(fontSize: 14.sp),
                labelColor: Pallet.blue,
                indicatorColor: Pallet.blue,
                indicatorWeight: 2.h,
                tabs: [
                  ...List.generate(
                    tabs.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(bottom: 6.h),
                      child: Text(tabs[index]),
                    ),
                  ),
                ]),
            Expanded(
                child: ListView(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                ...List.generate(
                    6,
                    (index) => Container(
                          padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 15.h),
                          decoration: BoxDecoration(
                              border: Border(
                            bottom:
                                BorderSide(color: Pallet.border, width: 1.w),
                          )),
                          child: Row(
                            children: [
                              selected == 1
                                  ? ImageLoader(
                                      height: 46.w,
                                      width: 46.w,
                                      isCircular: true,
                                      radius: 23.w,
                                      path: AppAssets.groupDp,
                                    )
                                  : index < 4
                                      ? Container(
                                          height: 46.w,
                                          width: 46.w,
                                          decoration: BoxDecoration(
                                              color: Pallet.greyLight,
                                              shape: BoxShape.circle),
                                          child: Center(
                                            child: ImageLoader(
                                              height: 31.w,
                                              width: 19.41.w,
                                              path: AppAssets.user,
                                            ),
                                          ),
                                        )
                                      : ImageLoader(
                                          height: 46.w,
                                          width: 46.w,
                                          isCircular: true,
                                          radius: 23.w,
                                          path: AppAssets.picture,
                                        ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      AppText.labelLarge(
                                        selected == 1
                                            ? "Group Name"
                                            : "Tabish Bin Tahir",
                                        maxLines: 1,
                                      ),
                                      SizedBox(
                                        width: 7.w,
                                      ),
                                      selected == 0
                                          ? Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 11.w,
                                                  vertical: 5.h),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30.r),
                                                color: Pallet.blue
                                                    .withOpacity(.08),
                                              ),
                                              child: AppText.bodyMedium(
                                                "Speciality",
                                                color: Pallet.blue,
                                              ),
                                            )
                                          : SizedBox()
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  AppText.bodyMedium(
                                    selected == 1
                                        ? "groupname_12"
                                        : "tabish_m2m",
                                    color: Pallet.greyMedium,
                                  )
                                ],
                              )),
                              ImageLoader(
                                height: 38.w,
                                width: 38.w,
                                isCircular: true,
                                radius: 19.w,
                                path: AppAssets.message,
                              )
                            ],
                          ),
                        ))
              ],
            )),
            AppText.bodyLarge(
              "Can’t find your contact?",
              color: Pallet.black,
            ),
            SizedBox(
              height: 14.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 8.h,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Pallet.black),
              child: AppText.bodyMedium(
                "Invite here",
                color: Pallet.white,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
