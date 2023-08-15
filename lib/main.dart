import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// App Pages
import 'pages/home.dart';
import 'pages/reader.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
          title: 'Scripture Alone',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
          ),
          routes: {
            '/': (context) => AppContainer(page: "bible"),
            '/downloads': (context) => AppContainer(page: "downloads"),
            '/devotionals': (context) => AppContainer(page: "devotionals"),
            '/notes': (context) => AppContainer(page: "notes"),
            '/settings': (context) => AppContainer(page: "settings"),
          }),
    );
  }
}

class AppContainer extends StatefulWidget {
  final String page;
  AppContainer({required this.page});

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    const pages = ['bible', 'downloads', 'devotionals', 'notes', 'settings'];
    Widget page;

    if (widget.page != 'bible') selectedIndex = pages.indexOf(widget.page);
    switch (selectedIndex) {
      case 0:
        selectedIndex = 0;
        page = BibleReader();
        break;
      case 1:
        selectedIndex = 1;
        page = GeneratorPage();
        break;
      case 2:
        selectedIndex = 2;
        page = FavoritesPage();
        break;
      case 3:
        selectedIndex = 3;
        page = BibleReader();
        break;
      case 4:
        selectedIndex = 4;
        page = BibleReader();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: page,
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              label: 'Bible',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.download),
              label: 'Downloads',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Devotionals',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.edit),
              label: 'Notes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.blueGrey[500],
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      );
    });
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asPascalCase),
          ),
      ],
    );
  }
}
