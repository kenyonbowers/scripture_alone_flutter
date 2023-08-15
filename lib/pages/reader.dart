import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io';

class BibleChapter {
  String bookId = "";
  String bookName = "";
  int chapter = 0;
  String header = "";
  String footer = "";
  String language = "";
  List<BibleVerse> verses = [];
}

class BibleVerse {
  int verse = 0;
  List<String> text = [];
  String info = "";
}

class MySecondHomePage extends StatefulWidget {
  @override
  State<MySecondHomePage> createState() => _MySecondHomePage();
}

class _MySecondHomePage extends State<MySecondHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = BibleReader();
        break;
      case 1:
        page = BibleReader();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 800,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.menu_book),
                    label: Text('Bible'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.download),
                    label: Text('Versions'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.book),
                    label: Text('Devotionals'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.edit),
                    label: Text('Notes'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.settings),
                    label: Text('Settings'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: BibleReader(),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class BibleReaderState extends ChangeNotifier {
  var chapterData = BibleChapter();

  Future<void> fetchChapterFromInternet() async {
    try {
      final response = await http.get(Uri.parse(
          'https://raw.githubusercontent.com/kenyonbowers/HostedBibleVersions/main/KJB1762/MRK/5.json'));
      if (response.statusCode == 200) {
        final jsonMap = json.decode(response.body);
        print(response.body.runtimeType);

        // Now, you need to map the JSON data to your BibleChapter class
        final BibleChapter chapter = BibleChapter();
        chapter.bookId = jsonMap['book_id'];
        chapter.bookName = jsonMap['book_name'];
        chapter.chapter = jsonMap['chapter'];
        chapter.header = jsonMap['header'];
        chapter.footer = jsonMap['footer'];
        chapter.language = jsonMap['language'];

        // Map the verses
        chapter.verses =
            List<BibleVerse>.from(jsonMap['verses'].map((verseMap) {
          final BibleVerse verse = BibleVerse();
          verse.verse = verseMap['verse'];
          verse.text = List<String>.from(verseMap['text']);
          verse.info = verseMap['info'];
          return verse;
        }));

        chapterData = chapter;
        notifyListeners();
      } else {
        // Handle error
        print('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exception
      print('Error: $e');
    }
  }

  // ...
}

class BibleReader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BibleReaderState(),
      child: MaterialApp(
        title: 'Scripture Alone',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        ),
        home: Reader(),
      ),
    );
  }
}

class Reader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<BibleReaderState>();
    var chapterData = appState.chapterData;

    return Center(
      child: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              appState.fetchChapterFromInternet();
            },
            child: Text('Next'),
          ),
          for (var verse in chapterData.verses) VerseText(verse: verse)
        ],
      ),
    );
  }
}

class VerseText extends StatelessWidget {
  const VerseText({
    super.key,
    required this.verse,
  });

  final BibleVerse verse;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var finalText = "";

    return Card(
      color: theme.colorScheme.secondary,
      elevation: 20,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: RichText(
          text: TextSpan(
            children: [
              for (var word in verse.text)
                if (word.startsWith("|*"))
                  TextSpan(
                    text: "${word.substring(2)} ",
                    style: TextStyle(
                        color: Colors.red, fontStyle: FontStyle.italic),
                  )
                else if (word.startsWith("|"))
                  TextSpan(
                    text: "${word.substring(1)} ",
                    style: TextStyle(color: Colors.red),
                  )
                else if (word.startsWith("*"))
                  TextSpan(
                    text: "${word.substring(1)} ",
                    style: TextStyle(
                        color: Colors.black, fontStyle: FontStyle.italic),
                  )
                else
                  TextSpan(
                    text: "${word} ",
                    style: TextStyle(color: Colors.black),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
