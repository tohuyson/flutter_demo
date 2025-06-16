import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/app_color.dart';
import 'package:flutter_demo/constants/app_extension.dart';
import 'package:flutter_demo/constants/app_size.dart';
import 'package:flutter_demo/models/email/email.dart';
import 'package:websafe_svg/websafe_svg.dart';

class EmailCard extends StatelessWidget {
  const EmailCard({super.key, this.isActive = true, required this.email, required this.press});

  final bool isActive;
  final EmailModel email;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: InkWell(
        onTap: press,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(AppSize.instance.defaultPadding),
              decoration: BoxDecoration(
                color: isActive ? AppColor.instance.kEmailPrimaryColor : AppColor.instance.kEmailBgDarkColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 32,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(email.image ?? ''),
                        ),
                      ),
                      SizedBox(width: AppSize.instance.defaultPadding / 2),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: "${email.name} \n",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: isActive ? Colors.white : AppColor.instance.kEmailTextColor,
                            ),
                            children: [
                              TextSpan(
                                text: email.subject,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: isActive ? Colors.white : AppColor.instance.kEmailTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            email.time ?? '',
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(color: isActive ? Colors.white70 : null),
                          ),
                          SizedBox(height: 5),
                          if (email.isAttachmentAvailable == true)
                            WebsafeSvg.asset(
                              "assets/images/Paperclip.svg",
                              colorFilter: ColorFilter.mode(
                                isActive ? Colors.white70 : AppColor.instance.kEmailGrayColor,
                                BlendMode.srcIn,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.instance.defaultPadding / 2),
                  Text(
                    email.body ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(height: 1.5, color: isActive ? Colors.white70 : null),
                  ),
                ],
              ),
            ).addNeumorphism(
              blurRadius: 15,
              borderRadius: 15,
              offset: Offset(5, 5),
              topShadowColor: Colors.white60,
              bottomShadowColor: Color(0xFF234395).withOpacity(0.15),
            ),
            if (email.isChecked == false)
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: AppColor.instance.kEmailBadgeColor),
                ).addNeumorphism(blurRadius: 4, borderRadius: 8, offset: Offset(2, 2)),
              ),
            if (email.tagColor != null)
              Positioned(
                left: 8,
                top: 0,
                child: WebsafeSvg.asset(
                  "assets/images/Markup filled.svg",
                  height: 18,
                  colorFilter: email.tagColor != null ? ColorFilter.mode(email.tagColor!, BlendMode.srcIn) : null,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
