import 'package:flutter/material.dart';
import 'package:nav_app_4_host/ui/general_widgets/user_map.dart';
import 'package:nav_app_4_host/ui/pages/home_page/widgets/app_drawer.dart';
import 'package:nav_app_4_host/ui/pages/home_page/widgets/floatin_button.dart';

import '../../general_widgets/application_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ApplicationAppBar(),
      drawer: AppDrawer(),
      floatingActionButton: FloatinButton(),
      body: Column(
        children: [Expanded(child: UserMap())],
      ),
    );
  }
}
