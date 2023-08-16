import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

var pageIndex = 0;

Future<void> setPage(index) async {
  try {
    pageIndex = index;
  } catch (err) {}
}

/*

*/

class SettingsPage extends StatefulWidget {
  final int pageIndex = 0;

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late int variableInB;

  @override
  void initState() {
    super.initState();
    pageIndex = widget.pageIndex;
  }

  void updateVariable(int newValue) {
    setState(() {
      pageIndex = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget page;

    switch (pageIndex) {
      case 0:
        page = MainPage(
          setPage: updateVariable,
          pageIndex: pageIndex,
        );
        break;
      case 1:
        page = SecondPage();
        break;
      default:
        throw UnimplementedError('no widget for $pageIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: page,
      );
    });
  }
}

class MainPage extends StatelessWidget {
  final Function(int) setPage;
  final int pageIndex;

  MainPage({required this.setPage, required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setPage(1); // Update the variable in Widget B
      },
      child: Text('Update Variable in Widget B'),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var chapterData = appState.chapterData;

    return Center(
      child: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              //appState.fetchChapterFromInternet();
            },
            child: Text('2'),
          ),
          //for (var verse in chapterData.verses) VerseText(verse: verse)
        ],
      ),
    );
  }
}
