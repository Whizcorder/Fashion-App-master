part of main_page_view;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/cart_count_widget.dart';
import '../../widgets/circle_tab_indicator.dart';

import '../recommanded_tab/recommanded_tab_view.dart';
import '../popular_tab/popular_tab_view.dart';

class _MainPageMobile extends StatefulWidget {
  final MainPageViewModel viewModel;
  final VoidCallback onMenuPressed;

  const _MainPageMobile({
    Key? key,
    required this.viewModel,
    required this.onMenuPressed,
  }) : super(key: key);

  @override
  __MainPageMobileState createState() => __MainPageMobileState();
}

class __MainPageMobileState extends State<_MainPageMobile>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        actions: <Widget>[
          const CartCountWidget(),
        ],

        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/images/menu.svg",
            height: 24,
            width: 24,
          ),
          onPressed: widget.onMenuPressed,
        ),

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      "Discover",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        const Icon(Icons.search),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            "assets/images/setting.svg",
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              TabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator:
                    const CircleTabIndicator(color: Colors.black, radius: 4),
                isScrollable: true,
                labelColor: Colors.black,
                tabs: const <Widget>[
                  Tab(text: 'Recommended'),
                  Tab(text: 'Popular'),
                ],
              ),
            ],
          ),
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          RecommandedTabView(),
          PopularTabView(),
        ],
      ),
    );
  }
}