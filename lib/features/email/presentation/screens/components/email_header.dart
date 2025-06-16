import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/app_size.dart';
import 'package:websafe_svg/websafe_svg.dart';

class EmailHeader extends StatelessWidget {
  const EmailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSize.instance.defaultPadding),
      child: Row(
        children: [
          if (AppSize.instance.isMobile()) BackButton(),
          IconButton(icon: WebsafeSvg.asset("assets/images/Trash.svg", width: 24), onPressed: () {}),
          SizedBox(width: AppSize.instance.defaultPadding / 2),
          IconButton(icon: WebsafeSvg.asset("assets/images/Reply.svg", width: 24), onPressed: () {}),
          SizedBox(width: AppSize.instance.defaultPadding / 2),
          IconButton(icon: WebsafeSvg.asset("assets/images/Reply all.svg", width: 24), onPressed: () {}),
          SizedBox(width: AppSize.instance.defaultPadding / 2),
          IconButton(icon: WebsafeSvg.asset("assets/images/Transfer.svg", width: 24), onPressed: () {}),
          Spacer(),
          if (AppSize.instance.isDesktop())
            IconButton(icon: WebsafeSvg.asset("assets/images/Printer.svg", width: 24), onPressed: () {}),
          SizedBox(width: AppSize.instance.defaultPadding / 2),
          IconButton(icon: WebsafeSvg.asset("assets/images/Markup.svg", width: 24), onPressed: () {}),
          SizedBox(width: AppSize.instance.defaultPadding / 2),
          IconButton(icon: WebsafeSvg.asset("assets/images/More vertical.svg", width: 24), onPressed: () {}),
          SizedBox(width: AppSize.instance.defaultPadding / 2),
        ],
      ),
    );
  }
}
