import 'package:auto_route/auto_route.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moon_design/moon_design.dart';
import 'package:rick_morty/app/router.gr.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      routes: const [
        HomeRoute(),
        EpisodeRoute(),
        LocationRoute(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      bottomNavigationBuilder: (context, tabsRouter) {
        return DotNavigationBar(
          marginR: EdgeInsets.symmetric(horizontal: 8.w),
          paddingR: EdgeInsets.all(4.w),
          borderRadius: 555.r,
          backgroundColor: context.isDarkMode ? Colors.black : Colors.white,
          unselectedItemColor:
              context.isDarkMode ? Colors.grey[800] : Colors.grey[300],
          selectedItemColor: context.isDarkMode ? Colors.white : Colors.black,
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            DotNavigationBarItem(
              icon: const Icon(Icons.face),
              selectedColor: Colors.blue,
            ),
            DotNavigationBarItem(
              icon: const Icon(Icons.movie),
              selectedColor: Colors.green,
            ),
            DotNavigationBarItem(
              icon: const Icon(Icons.place),
              selectedColor: Colors.red,
            ),
          ],
        );
      },
    );
  }
}
