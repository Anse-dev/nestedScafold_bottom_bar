import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

import 'package:go_router/go_router.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(
            key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 450) {
        return ScaffoldWithNavigationBar(
          body: navigationShell,
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: _goBranch,
        );
      } else {
        return ScaffoldWithNavigationRail(
          body: navigationShell,
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: _goBranch,
        );
      }
    });
  }
}

class ScaffoldWithNavigationBar extends StatefulWidget {
  const ScaffoldWithNavigationBar({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  State<ScaffoldWithNavigationBar> createState() =>
      _ScaffoldWithNavigationBarState();
}

class _ScaffoldWithNavigationBarState extends State<ScaffoldWithNavigationBar> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      key: _scaffoldKey,
      body: widget.body,
      bottomNavigationBar: CustomBottomNavigationBar(
        onDestinationSelected: widget.onDestinationSelected,
        selectedIndex: widget.selectedIndex,
      ),
    );
  }
}

class ScaffoldWithNavigationRail extends StatelessWidget {
  const ScaffoldWithNavigationRail({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });
  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            labelType: NavigationRailLabelType.all,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                label: Text('Home'),
                icon: Icon(Icons.home),
              ),
              NavigationRailDestination(
                label: Text('Publier'),
                icon: Icon(Icons.settings),
              ),
              NavigationRailDestination(
                label: Text('vos trajets'),
                icon: Icon(Icons.settings),
              ),
              NavigationRailDestination(
                label: Text('messages'),
                icon: Icon(Icons.settings),
              ),
              NavigationRailDestination(
                label: Text('profil'),
                icon: Icon(Icons.settings),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(
            child: body,
          ),
        ],
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(
          thickness: 2.5,
          height: 1.2,
          color: Color.fromARGB(137, 196, 193, 193),
        ),
        BottomNavigationBar(
          currentIndex: widget.selectedIndex,
          backgroundColor: Colors.white,
          elevation: 1.0,
          selectedItemColor: Colors.black, // Active item color
          unselectedItemColor: Colors.grey, // Inactive item color
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold, // Bold text for active item
          ),
          showUnselectedLabels: true,
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.normal, // Normal text for inactive items
          ),
          items: const [
            BottomNavigationBarItem(
              label: 'Rechercher',
              icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
            ),
            BottomNavigationBarItem(
              label: 'Publier',
              icon: FaIcon(FontAwesomeIcons.circlePlus),
            ),
            BottomNavigationBarItem(
              label: 'Vos trajets',
              icon: FaIcon(FontAwesomeIcons.carOn),
            ),
            BottomNavigationBarItem(
              label: 'Messages',
              icon: FaIcon(FontAwesomeIcons.comments),
            ),
          ],
          onTap: widget.onDestinationSelected,
        ),
      ],
    );
  }
}
