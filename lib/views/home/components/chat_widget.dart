import 'package:chat_phi/core/app_assets.dart';
import 'package:chat_phi/core/app_colors.dart';
import 'package:chat_phi/core/text_styles.dart';
import 'package:chat_phi/models/chat_model.dart';
import 'package:chat_phi/widgets/app_text.dart';
import 'package:chat_phi/widgets/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({
    super.key,
    required this.chat,
    this.onTap,
  });
  final ChatModel chat;
  final Function()? onTap;

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Slidable(
        endActionPane:
            ActionPane(extentRatio: .19, motion: DrawerMotion(), children: [
          Flexible(
            flex: 1,
            child: Container(
              color: Pallet.blue,
              // padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 22.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageLoader(
                    height: 5.6.w,
                    width: 20.w,
                    path: AppAssets.more,
                  ),
                  AppText.bodySmall(
                    "More",
                    color: Pallet.white,
                  )
                ],
              ),
            ),
          )
        ]),
        child: Container(
          padding: EdgeInsets.fromLTRB(20.w, 11.h, 20.w, 14.h),
          decoration: BoxDecoration(
              color: Pallet.white,
              border: Border(
                bottom: BorderSide(color: Pallet.border),
              )),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.chat.profilePic == null
                  ? widget.chat.isGroup
                      ? ImageLoader(
                          height: 46.w,
                          width: 46.w,
                          isCircular: true,
                          radius: 23.w,
                          path: AppAssets.groupDp,
                        )
                      : Container(
                          height: 46.w,
                          width: 46.w,
                          decoration: BoxDecoration(
                              color: Pallet.greyLight, shape: BoxShape.circle),
                          child: Center(
                            child: ImageLoader(
                              height: 31.w,
                              width: 19.41.w,
                              path: AppAssets.user,
                            ),
                          ),
                        )
                  : widget.chat.isGroup
                      ? SizedBox(
                          height: 46.w,
                          width: 46.w,
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              ImageLoader(
                                height: 46.w,
                                width: 46.w,
                                isCircular: true,
                                radius: 23.w,
                                path: AppAssets.groupDp,
                              ),
                              ImageLoader(
                                height: 17.w,
                                width: 17.w,
                                isCircular: true,
                                radius: 8.5.w,
                                path: widget.chat.profilePic,
                              ),
                            ],
                          ),
                        )
                      : ImageLoader(
                          height: 46.w,
                          width: 46.w,
                          isCircular: true,
                          radius: 23.w,
                          path: widget.chat.profilePic,
                        ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.labelLarge(
                    widget.chat.name,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  widget.chat.isGroup
                      ? Text.rich(TextSpan(children: [
                          TextSpan(
                              text: widget.chat.sentBy,
                              style: bodyMedium.copyWith(
                                  fontSize: 13.sp, color: Pallet.blue)),
                          TextSpan(
                              text: " ${widget.chat.lastMessage}",
                              style: bodyMedium)
                        ]))
                      : AppText.bodyMedium(
                          widget.chat.lastMessage,
                          maxLines: 1,
                        ),
                ],
              )),
              SizedBox(
                width: 10.w,
              ),
              AppText.bodyMedium(
                "1 hour",
                color: Pallet.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
