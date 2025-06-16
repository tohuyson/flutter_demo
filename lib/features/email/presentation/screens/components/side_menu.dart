import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/app_color.dart';
import 'package:flutter_demo/constants/app_extension.dart';
import 'package:flutter_demo/constants/app_size.dart';
import 'package:flutter_demo/features/email/presentation/screens/components/side_menu_item.dart';
import 'package:flutter_demo/features/email/presentation/screens/components/tags.dart';
import 'package:websafe_svg/websafe_svg.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSize.instance.defaultPadding),
      color: AppColor.instance.kEmailBgLightColor,
      child: Column(
        children: [
          Image.asset("assets/images/Logo Outlook.png", width: 46),
          SizedBox(height: AppSize.instance.defaultPadding),
          TextButton.icon(
            style: TextButton.styleFrom(
              backgroundColor: AppColor.instance.kEmailPrimaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.instance.defaultPadding * 1.5,
                vertical: AppSize.instance.defaultPadding,
              ),
            ),
            // minWidth: double.infinity,
            // padding: EdgeInsets.symmetric(
            //   horizontal: AppSize.instance.defaultPadding * 1.5,
            //   vertical: AppSize.instance.defaultPadding,
            // ),
            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            // color: AppColor.instance.kEmailPrimaryColor,
            onPressed: () {},
            icon: WebsafeSvg.asset("assets/images/Edit.svg", width: 16),
            label: Text("New message", style: TextStyle(color: Colors.white)),
          ).addNeumorphism(topShadowColor: Colors.white, bottomShadowColor: Color(0xFF234395).withOpacity(0.2)),
          SizedBox(height: AppSize.instance.defaultPadding),
          TextButton.icon(
            style: TextButton.styleFrom(
              backgroundColor: AppColor.instance.kEmailBgDarkColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.instance.defaultPadding * 1.5,
                vertical: AppSize.instance.defaultPadding,
              ),
            ),
            // minWidth: double.infinity,
            // padding: EdgeInsets.symmetric(
            //   horizontal: AppSize.instance.defaultPadding * 1.5,
            //   vertical: AppSize.instance.defaultPadding,
            // ),
            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            // color: AppColor.instance.kEmailBgDarkColor,
            onPressed: () {},
            icon: WebsafeSvg.asset("assets/images/Download.svg", width: 16),
            label: Text("Get messages", style: TextStyle(color: AppColor.instance.kEmailTextColor)),
          ).addNeumorphism(),
          SizedBox(height: AppSize.instance.defaultPadding * 2),
          // Menu Items
          SideMenuItem(press: () {}, title: "Inbox", iconSrc: "assets/images/Inbox.svg", isActive: true, itemCount: 3),
          SideMenuItem(press: () {}, title: "Sent", iconSrc: "assets/images/Send.svg", isActive: false),
          SideMenuItem(press: () {}, title: "Drafts", iconSrc: "assets/images/File.svg", isActive: false),
          SideMenuItem(
            press: () {},
            title: "Deleted",
            iconSrc: "assets/images/Trash.svg",
            isActive: false,
            showBorder: false,
          ),

          SizedBox(height: AppSize.instance.defaultPadding * 2),
          // Tags
          Tags(),
        ],
      ),
    );
  }
}
