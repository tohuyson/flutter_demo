import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/app_size.dart';
import 'package:flutter_demo/features/clock/presentation/screens/components/clock_component.dart';
import 'package:flutter_svg/svg.dart';

class ClockPage extends StatelessWidget {
  const ClockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(context), body: const ClockComponent());
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/images/Settings.svg",
          // color: Theme.of(context).iconTheme.color,
        ),
        onPressed: () {},
      ),
      actions: [buildAddButton(context)],
    );
  }

  Padding buildAddButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.instance.getProportionateScreenWidth(10)),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: AppSize.instance.getProportionateScreenWidth(32),
          decoration: BoxDecoration(color: Theme.of(context).primaryColor, shape: BoxShape.circle),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
