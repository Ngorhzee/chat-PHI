import 'package:chat_phi/core/app_assets.dart';
import 'package:chat_phi/core/app_colors.dart';
import 'package:chat_phi/models/chat_model.dart';
import 'package:chat_phi/views/home/chat_view/chat_view.dart';
import 'package:chat_phi/views/home/components/chat_widget.dart';
import 'package:chat_phi/views/home/contact_view.dart';
import 'package:chat_phi/widgets/app_text.dart';
import 'package:chat_phi/widgets/edit_form_widget.dart';
import 'package:chat_phi/widgets/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selected = 0;
  List<String> tabs = ["All", "Groups", "Unread"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        height: 62.w,
        width: 62.w,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Pallet.blue),
        child: Center(
          child: ImageLoader(
            height: 25.w,
            width: 25.w,
            path: AppAssets.add,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const HomeActionsWidget(
                              icon: AppAssets.menu,
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            AppText.headlineMedium("Home"),
                            const Spacer(),
                            const HomeActionsWidget(
                              icon: AppAssets.group,
                              title: "Groups",
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ContactView())),
                              child: const HomeActionsWidget(
                                icon: AppAssets.contacts,
                                title: "Contacts",
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            const HomeActionsWidget(
                              icon: AppAssets.settings,
                              title: "Settings",
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        EditFormOutlinedField(
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
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            ...List.generate(
                                3,
                                (index) => InkWell(
                                      onTap: () {
                                        selected = index;

                                        setState(() {});
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 6.h, horizontal: 18.w),
                                        margin: EdgeInsets.only(right: 8.w),
                                        decoration: BoxDecoration(
                                            color: selected == index
                                                ? Pallet.blue.withOpacity(.15)
                                                : Pallet.greyLight,
                                            borderRadius:
                                                BorderRadius.circular(30.r)),
                                        child: Center(
                                          child: AppText.bodyMedium(
                                            tabs[index],
                                            fontSize: 14.sp,
                                            color: selected == index
                                                ? Pallet.blue
                                                : Pallet.greyMedium,
                                          ),
                                        ),
                                      ),
                                    ))
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                      child: ListView(
                    children: [
                      ChatWidget(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChatView())),
                        chat: ChatModel(
                            name: "Tabish Bin Tahir",
                            lastMessage: "Hi Tabish, how are you doing?",
                            isGroup: false),
                      ),
                      ChatWidget(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChatView())),
                        chat: ChatModel(
                            name: "Tabish Bin Tahir",
                            lastMessage: "Hi Tabish, how are you doing?",
                            isGroup: false),
                      ),
                      ChatWidget(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChatView())),
                        chat: ChatModel(
                            name: "Tabish Bin Tahir",
                            lastMessage: "Hi Tabish, how are you doing?",
                            isGroup: false),
                      ),
                      ChatWidget(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChatView())),
                        chat: ChatModel(
                            name: "Tabish Bin Tahir",
                            lastMessage: "Hi Tabish, how are you doing?",
                            isGroup: false),
                      ),
                      ChatWidget(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChatView())),
                        chat: ChatModel(
                            name: "Tabish Bin Tahir",
                            lastMessage: "Hi Tabish, how are you doing?",
                            isGroup: false,
                            profilePic: AppAssets.picture),
                      ),
                      ChatWidget(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChatView())),
                        chat: ChatModel(
                            name: "Group Name",
                            lastMessage: "Hi Tabish, how are you doing?",
                            isGroup: true,
                            profilePic: AppAssets.picture2,
                            sentBy: "Anna:"),
                      ),
                      ChatWidget(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChatView())),
                        chat: ChatModel(
                            name: "Group Name",
                            lastMessage: "Hi Tabish, how are you doing?",
                            isGroup: true,
                            profilePic: AppAssets.picture2,
                            sentBy: "Anna:"),
                      ),
                    ],
                  ))
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Pallet.black,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: AppText.bodyMedium(
                  "Send new message",
                  fontSize: 14.sp,
                  color: Pallet.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomeActionsWidget extends StatelessWidget {
  const HomeActionsWidget({
    super.key,
    required this.icon,
    this.title,
  });
  final String icon;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 37.w,
          width: 37.w,
          decoration: const BoxDecoration(
              color: Pallet.greyLight, shape: BoxShape.circle),
          child: Center(
            child: ImageLoader(
              height: 18.w,
              width: 18.w,
              path: icon,
              // fit: BoxFit.cover,
            ),
          ),
        ),
        title != null
            ? Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: AppText.bodySmall(title!),
              )
            : const SizedBox()
      ],
    );
  }
}
