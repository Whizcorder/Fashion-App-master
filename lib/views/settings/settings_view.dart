library settings_view;

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'settings_view_model.dart';

part 'settings_desktop.dart';
part 'settings_mobile.dart';
part 'settings_tablet.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  late SettingsViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = SettingsViewModel();

    // If your viewModel needs init logic, call it here
    // viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => _SettingsMobile(viewModel),
      tablet: (BuildContext context) => _SettingsTablet(viewModel),
      desktop: (BuildContext context) => _SettingsDesktop(viewModel),
    );
  }
}