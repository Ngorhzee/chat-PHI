import 'package:chat_phi/core/app_assets.dart';
import 'package:chat_phi/core/app_colors.dart';
import 'package:chat_phi/widgets/app_text.dart';
import 'package:chat_phi/widgets/edit_form_widget.dart';
import 'package:chat_phi/widgets/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatView extends StatelessWidget {
  static const route = "/chatView";
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                  ImageLoader(
                    height: 46.w,
                    width: 46.w,
                    isCircular: true,
                    radius: 23.w,
                    path: AppAssets.picture2,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppText.labelLarge(
                        "Anna Paul",
                        color: Pallet.white,
                      ),
                      AppText.bodyMedium(
                        "Active 15 min ago",
                        color: Pallet.white,
                      )
                    ],
                  ))
                ],
              ),
            ),
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  SenderWidget(
                      message:
                          "Hi Borther! Not sure if the address is correct for this job."),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: AppText.bodySmall(
                      "Today 9:30 pm",
                      centered: true,
                      color: Color(0xff9D9D9D),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  RecieverWidget(
                      message: "Let me check but I think we had it right"),
                  SizedBox(
                    height: 20.h,
                  ),
                  SenderWidget(
                      message:
                          "Just confirmed and yes it is incorrect. Julie, can you please change it since you are the boss?"),
                  SizedBox(
                    height: 20.h,
                  ),
                  RecieverWidget(message: "Yep, I will get that done now"),
                  SizedBox(
                    height: 20.h,
                  ),
                  SenderWidget(message: "Thank you and talk soon!"),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 138.w,
                        width: 190.w,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ImageLoader(
                              height: 138.w,
                              width: 190.w,
                              path: AppAssets.chatPic,
                            ),
                            ImageLoader(
                              height: 40.w,
                              width: 40.w,
                              path: AppAssets.download,
                              isCircular: true,
                              radius: 20.w,
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              children: [
                ImageLoader(
                  height: 26.w,
                  width: 23.w,
                  path: AppAssets.pin,
                ),
                SizedBox(
                  width: 12.w,
                ),
                Expanded(
                  child: EditFormOutlinedField(
                    hint: "Start typing a message...",
                    suffixWidget: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
                      child: ImageLoader(
                        height: 31.w,
                        width: 31.w,
                        path: AppAssets.send,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}

class SenderWidget extends StatelessWidget {
  const SenderWidget({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(maxWidth: 243.w),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
            color: Pallet.greyLight, borderRadius: BorderRadius.circular(10.r)),
        child: AppText.bodySmall(
          message,
          fontSize: 12.sp,
          color: Pallet.greyBold,
        ),
      ),
    );
  }
}

class RecieverWidget extends StatelessWidget {
  const RecieverWidget({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          ImageLoader(
            height: 33.w,
            width: 33.w,
            isCircular: true,
            radius: 16.5.w,
            path: AppAssets.picture2,
          ),
          SizedBox(
            width: 8.w,
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 261.w),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Pallet.blue)),
            child: AppText.bodySmall(
              message,
              fontSize: 12.sp,
              color: Pallet.blackMedium,
            ),
          ),
        ],
      ),
    );
  }
}
