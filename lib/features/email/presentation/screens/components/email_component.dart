import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/app_color.dart';
import 'package:flutter_demo/constants/app_size.dart';
import 'package:flutter_demo/features/email/presentation/screens/components/email_header.dart';
import 'package:flutter_demo/models/email/email.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:websafe_svg/websafe_svg.dart';

class EmailComponent extends StatelessWidget {
  const EmailComponent({this.email});

  final EmailModel? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              EmailHeader(),
              Divider(thickness: 1),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(AppSize.instance.defaultPadding),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        maxRadius: 24,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage(emails[1].image ?? ''),
                      ),
                      SizedBox(width: AppSize.instance.defaultPadding),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          text: emails[1].name,
                                          style: Theme.of(context).textTheme.labelLarge,
                                          children: [
                                            TextSpan(
                                              text: "  <elvia.atkins@gmail.com> to Jerry Torp",
                                              style: Theme.of(context).textTheme.bodySmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "Inspiration for our new home",
                                        style: Theme.of(context).textTheme.titleLarge,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: AppSize.instance.defaultPadding / 2),
                                Text("Today at 15:32", style: Theme.of(context).textTheme.bodySmall),
                              ],
                            ),
                            SizedBox(height: AppSize.instance.defaultPadding),
                            LayoutBuilder(
                              builder:
                                  (context, constraints) => SizedBox(
                                    width: constraints.maxWidth > 850 ? 800 : constraints.maxWidth,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Hello my love, \n \nSunt architecto voluptatum esse tempora sint nihil minus incidunt nisi. Perspiciatis natus quo unde magnam numquam pariatur amet ut. Perspiciatis ab totam. Ut labore maxime provident. Voluptate ea omnis et ipsum asperiores laborum repellat explicabo fuga. Dolore voluptatem praesentium quis eos laborum dolores cupiditate nemo labore. \n \nLove you, \n\nElvia",
                                          style: TextStyle(
                                            height: 1.5,
                                            color: Color(0xFF4D5875),
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        SizedBox(height: AppSize.instance.defaultPadding),
                                        Row(
                                          children: [
                                            Text("6 attachments", style: TextStyle(fontSize: 12)),
                                            Spacer(),
                                            Text("Download All", style: Theme.of(context).textTheme.bodySmall),
                                            SizedBox(width: AppSize.instance.defaultPadding / 4),
                                            WebsafeSvg.asset(
                                              "assets/images/Download.svg",
                                              height: 16,
                                              colorFilter: ColorFilter.mode(
                                                AppColor.instance.kEmailGrayColor,
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(thickness: 1),
                                        SizedBox(height: AppSize.instance.defaultPadding / 2),
                                        SizedBox(
                                          height: 200,
                                          child: StaggeredGrid.count(
                                            crossAxisCount: 4,
                                            // itemCount: 3,
                                            // itemBuilder:
                                            //     (BuildContext context, int index) => ClipRRect(
                                            //       borderRadius: BorderRadius.circular(8),
                                            //       child: Image.asset("assets/images/Img_$index.png", fit: BoxFit.cover),
                                            //     ),
                                            // staggeredTileBuilder:
                                            //     (int index) => StaggeredTile.count(2, index.isOdd ? 2 : 1),
                                            mainAxisSpacing: AppSize.instance.defaultPadding,
                                            crossAxisSpacing: AppSize.instance.defaultPadding,
                                            children: [
                                              for (int i = 0; i < 3; i++)
                                                StaggeredGridTile.count(
                                                  crossAxisCellCount: 2,
                                                  mainAxisCellCount: 2,
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(8),
                                                    child: Image.asset("assets/images/Img_$i.png", fit: BoxFit.cover),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
