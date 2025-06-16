import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/app_color.dart';
import 'package:flutter_demo/constants/app_size.dart';
import 'package:flutter_demo/features/email/presentation/screens/components/email_card.dart';
import 'package:flutter_demo/features/email/presentation/screens/components/email_component.dart';
import 'package:flutter_demo/features/email/presentation/screens/components/side_menu.dart';
import 'package:flutter_demo/models/email/email.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ListOfEmails extends StatefulWidget {
  const ListOfEmails({super.key});

  @override
  _ListOfEmailsState createState() => _ListOfEmailsState();
}

class _ListOfEmailsState extends State<ListOfEmails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: ConstrainedBox(constraints: BoxConstraints(maxWidth: 250), child: SideMenu()),
      body: Container(
        padding: EdgeInsets.only(top: kIsWeb ? AppSize.instance.defaultPadding : 0),
        color: AppColor.instance.kEmailBgDarkColor,
        child: SafeArea(
          right: false,
          child: Column(
            children: [
              // This is our Seearch bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSize.instance.defaultPadding),
                child: Row(
                  children: [
                    // Once user click the menu icon the menu shows like drawer
                    // Also we want to hide this menu icon on desktop
                    if (!AppSize.instance.isDesktop())
                      IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                      ),
                    if (!AppSize.instance.isDesktop()) SizedBox(width: 5),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: "Search",
                          fillColor: AppColor.instance.kEmailBgLightColor,
                          filled: true,
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(AppSize.instance.defaultPadding * 0.75), //15
                            child: WebsafeSvg.asset("assets/images/Search.svg", width: 24),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSize.instance.defaultPadding),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSize.instance.defaultPadding),
                child: Row(
                  children: [
                    WebsafeSvg.asset(
                      "assets/images/Angle down.svg",
                      width: 16,
                      colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
                    ),
                    SizedBox(width: 5),
                    Text("Sort by date", style: TextStyle(fontWeight: FontWeight.w500)),
                    Spacer(),
                    MaterialButton(
                      minWidth: 20,
                      onPressed: () {},
                      child: WebsafeSvg.asset("assets/images/Sort.svg", width: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSize.instance.defaultPadding),
              Expanded(
                child: ListView.builder(
                  itemCount: emails.length,
                  // On mobile this active dosen't mean anything
                  itemBuilder:
                      (context, index) => EmailCard(
                        isActive: AppSize.instance.isMobile() ? false : index == 0,
                        email: emails[index],
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EmailComponent(email: emails[index])),
                          );
                        },
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
