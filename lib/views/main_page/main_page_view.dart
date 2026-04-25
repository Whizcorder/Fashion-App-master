library main_page_view;

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'main_page_view_model.dart';

part 'main_page_mobile.dart';
part 'main_page_tablet.dart';
part 'main_page_desktop.dart';

class MainPageView extends StatelessWidget {
  const MainPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = MainPageViewModel();

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(child: Text("Menu")),
            ListTile(title: Text("Home")),
            ListTile(title: Text("Profile")),
          ],
        ),
      ),

      body: ScreenTypeLayout.builder(
        mobile: (_) => _MainPageMobile(
          viewModel: viewModel,
          onMenuPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),

        tablet: (_) => _MainPageTablet(
          viewModel: viewModel,
          onMenuPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),

        desktop: (_) => _MainPageDesktop(
          viewModel: viewModel,
          onMenuPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
    );
  }
}