import 'package:flutter/material.dart';
import 'package:flutter_demo/common/app_layout.dart';
import 'package:flutter_demo/constants/app_size.dart';
import 'package:flutter_demo/features/email/presentation/screens/components/email_component.dart';
import 'package:flutter_demo/features/email/presentation/screens/components/list_of_emails.dart';
import 'package:flutter_demo/features/email/presentation/screens/components/side_menu.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = AppSize.instance.screenWidth;
    return Scaffold(
      body: AppLayout(
        mobile: ListOfEmails(),
        tablet: Row(children: [Expanded(flex: 6, child: ListOfEmails()), Expanded(flex: 9, child: EmailComponent())]),
        desktop: Row(
          children: [
            // Once our width is less then 1300 then it start showing errors
            // Now there is no error if our width is less then 1340
            Expanded(flex: width > 1340 ? 2 : 4, child: SideMenu()),
            Expanded(flex: width > 1340 ? 3 : 5, child: ListOfEmails()),
            Expanded(flex: width > 1340 ? 8 : 10, child: EmailComponent()),
          ],
        ),
      ),
    );
  }
}
