import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/app_color.dart';
import 'package:flutter_demo/constants/app_size.dart';
import 'package:websafe_svg/websafe_svg.dart';

class Tags extends StatelessWidget {
  const Tags({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            WebsafeSvg.asset("assets/images/Angle down.svg", width: 16),
            SizedBox(width: AppSize.instance.defaultPadding / 4),
            WebsafeSvg.asset("assets/images/Markup.svg", width: 20),
            SizedBox(width: AppSize.instance.defaultPadding / 2),
            Text(
              "Tags",
              style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColor.instance.kEmailGrayColor),
            ),
            Spacer(),
            MaterialButton(
              padding: EdgeInsets.all(10),
              minWidth: 40,
              onPressed: () {},
              child: Icon(Icons.add, color: AppColor.instance.kEmailGrayColor, size: 20),
            ),
          ],
        ),
        SizedBox(height: AppSize.instance.defaultPadding / 2),
        buildTag(context, color: Color(0xFF23CF91), title: "Design"),
        buildTag(context, color: Color(0xFF3A6FF7), title: "Work"),
        buildTag(context, color: Color(0xFFF3CF50), title: "Friends"),
        buildTag(context, color: Color(0xFF8338E1), title: "Family"),
      ],
    );
  }

  InkWell buildTag(BuildContext context, {required Color color, required String title}) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.fromLTRB(AppSize.instance.defaultPadding * 1.5, 10, 0, 10),
        child: Row(
          children: [
            WebsafeSvg.asset(
              "assets/images/Markup filled.svg",
              height: 18,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
            SizedBox(width: AppSize.instance.defaultPadding / 2),
            Text(
              title,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(color: AppColor.instance.kEmailGrayColor),
            ),
          ],
        ),
      ),
    );
  }
}
