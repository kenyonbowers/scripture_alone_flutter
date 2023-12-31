import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'pages/reader.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldBottomNavigationBar'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool success = false;
        if (navigationShell.currentIndex != 0) {
          success = true;
          navigationShell.goBranch(0);
        } else {
          SystemNavigator.pop();
        }
        return true;
      },
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_book), label: 'Bible'),
            BottomNavigationBarItem(
                icon: Icon(Icons.download), label: 'Downloads'),
            BottomNavigationBarItem(
                icon: Icon(Icons.book), label: 'Devotionals'),
            BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Notes'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
          currentIndex: navigationShell.currentIndex,
          onTap: (int tappedIndex) {
            navigationShell.goBranch(tappedIndex);
          },
          selectedItemColor: Colors.blueGrey[600],
          unselectedItemColor: Colors.blueGrey[400],
          backgroundColor: Colors.white,
          iconSize: 24,
        ),
      ),
    );
  }
}

class MainRouter extends StatelessWidget {
  MainRouter({super.key});

  final GoRouter _router = GoRouter(
    initialLocation: '/bible',
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return NavBar(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/bible',
                builder: (BuildContext context, GoRouterState state) {
                  return BiblePage();
                },
                routes: <RouteBase>[
                  GoRoute(
                    path: 'details',
                    builder: (BuildContext context, GoRouterState state) {
                      return const DetailsScreen(label: 'A');
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/sectionB',
                builder: (BuildContext context, GoRouterState state) {
                  return const RootScreen(
                    label: 'Section B',
                    detailsPath: '/sectionB/details',
                  );
                },
                routes: <RouteBase>[
                  GoRoute(
                    path: 'details',
                    builder: (BuildContext context, GoRouterState state) {
                      return const DetailsScreen(label: 'B');
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/sectionC',
                builder: (BuildContext context, GoRouterState state) {
                  return const RootScreen(
                    label: 'Section C',
                    detailsPath: '/sectionC/details',
                  );
                },
                routes: <RouteBase>[
                  GoRoute(
                    path: 'details',
                    builder: (BuildContext context, GoRouterState state) {
                      return const DetailsScreen(label: 'C');
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Go_router Complex Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      routerConfig: _router,
    );
  }
}

class RootScreen extends StatelessWidget {
  const RootScreen({
    required this.label,
    required this.detailsPath,
    super.key,
  });

  final String label;
  final String detailsPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Root of section $label'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Screen $label',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Padding(padding: EdgeInsets.all(4)),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go(detailsPath);
              },
              child: const Text('View details'),
            ),
            const Padding(padding: EdgeInsets.all(4)),
          ],
        ),
      ),
    );
  }
}

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    required this.label,
    super.key,
  });

  final String label;

  @override
  State<StatefulWidget> createState() => DetailsScreenState();
}

class DetailsScreenState extends State<DetailsScreen> {
  int _counter = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Screen - ${widget.label}'),
      ),
      body: _build(context),
    );
  }

  Widget _build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Details for ${widget.label} - Counter: $_counter',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Padding(padding: EdgeInsets.all(4)),
          TextButton(
            onPressed: () {
              setState(() {
                _counter++;
              });
            },
            child: const Text('Increment counter'),
          ),
          const Padding(padding: EdgeInsets.all(8)),
          const Padding(padding: EdgeInsets.all(4)),
          TextButton(
            onPressed: () {
              GoRouter.of(context).go('/login');
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}

class DetailLoginScreen extends StatelessWidget {
  const DetailLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details Login Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <ElevatedButton>[
            ElevatedButton(
              onPressed: () {
                // context.go('/sectionA');
                context.go('/sectionB');
              },
              child: const Text('Go to BottomNavBar'),
            ),
          ],
        ),
      ),
    );
  }
}
