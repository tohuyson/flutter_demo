import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/app_color.dart';
import 'package:flutter_demo/constants/app_size.dart';
import 'package:flutter_demo/features/email/presentation/screens/components/counter_badge.dart';
import 'package:websafe_svg/websafe_svg.dart';

class SideMenuItem extends StatelessWidget {
  const SideMenuItem({
    super.key,
    required this.isActive,
    this.isHover = false,
    this.itemCount,
    this.showBorder = true,
    required this.iconSrc,
    required this.title,
    required this.press,
  });

  final bool isActive, isHover, showBorder;
  final int? itemCount;
  final String iconSrc, title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppSize.instance.defaultPadding),
      child: InkWell(
        onTap: press,
        child: Row(
          children: [
            (isActive || isHover) ? WebsafeSvg.asset("assets/images/Angle right.svg", width: 15) : SizedBox(width: 15),
            SizedBox(width: AppSize.instance.defaultPadding / 4),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 15, right: 5),
                decoration:
                    showBorder ? BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFFDFE2EF)))) : null,
                child: Row(
                  children: [
                    WebsafeSvg.asset(
                      iconSrc,
                      height: 20,
                      colorFilter: ColorFilter.mode(
                        (isActive || isHover)
                            ? AppColor.instance.kEmailPrimaryColor
                            : AppColor.instance.kEmailGrayColor,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(width: AppSize.instance.defaultPadding * 0.75),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color:
                            (isActive || isHover)
                                ? AppColor.instance.kEmailTextColor
                                : AppColor.instance.kEmailGrayColor,
                      ),
                    ),
                    Spacer(),
                    if (itemCount != null) CounterBadge(count: itemCount!),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
