import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io';

class BibleReaderState extends ChangeNotifier {
  var currentChapter = {
  "book_id": "GEN",
  "book_name": "Genesis",
  "chapter": 1,
  "header": "",
  "footer": "",
  "language": "English",
  "verses": [
    {
      "verse": 1,
      "text": [
        "In",
        "the",
        "beginning",
        "God",
        "created",
        "the",
        "heaven",
        "and",
        "the",
        "earth."
      ],
      "info": ""
    },
    {
      "verse": 2,
      "text": [
        "And",
        "the",
        "earth",
        "was",
        "without",
        "form,",
        "and",
        "void;",
        "and",
        "darkness",
        "*was",
        "upon",
        "the",
        "face",
        "of",
        "the",
        "deep.",
        "And",
        "the",
        "Spirit",
        "of",
        "God",
        "moved",
        "upon",
        "the",
        "face",
        "of",
        "the",
        "waters."
      ],
      "info": ""
    },
    {
      "verse": 3,
      "text": [
        "And",
        "God",
        "said,",
        "Let",
        "there",
        "be",
        "light:",
        "and",
        "there",
        "was",
        "light."
      ],
      "info": ""
    },
    {
      "verse": 4,
      "text": [
        "And",
        "God",
        "saw",
        "the",
        "light,",
        "that",
        "*it",
        "*was",
        "good:",
        "and",
        "God",
        "divided",
        "the",
        "light",
        "from",
        "the",
        "darkness."
      ],
      "info": ""
    },
    {
      "verse": 5,
      "text": [
        "And",
        "God",
        "called",
        "the",
        "light",
        "Day,",
        "and",
        "the",
        "darkness",
        "he",
        "called",
        "Night.",
        "And",
        "the",
        "evening",
        "and",
        "the",
        "morning",
        "were",
        "the",
        "first",
        "day."
      ],
      "info": ""
    },
    {
      "verse": 6,
      "text": [
        "¶",
        "And",
        "God",
        "said,",
        "Let",
        "there",
        "be",
        "a",
        "firmament",
        "in",
        "the",
        "midst",
        "of",
        "the",
        "waters,",
        "and",
        "let",
        "it",
        "divide",
        "the",
        "waters",
        "from",
        "the",
        "waters."
      ],
      "info": ""
    },
    {
      "verse": 7,
      "text": [
        "And",
        "God",
        "made",
        "the",
        "firmament,",
        "and",
        "divided",
        "the",
        "waters",
        "which",
        "*were",
        "under",
        "the",
        "firmament",
        "from",
        "the",
        "waters",
        "which",
        "*were",
        "above",
        "the",
        "firmament:",
        "and",
        "it",
        "was",
        "so."
      ],
      "info": ""
    },
    {
      "verse": 8,
      "text": [
        "And",
        "God",
        "called",
        "the",
        "firmament",
        "Heaven.",
        "And",
        "the",
        "evening",
        "and",
        "the",
        "morning",
        "were",
        "the",
        "second",
        "day."
      ],
      "info": ""
    },
    {
      "verse": 9,
      "text": [
        "¶",
        "And",
        "God",
        "said,",
        "Let",
        "the",
        "waters",
        "under",
        "the",
        "heaven",
        "be",
        "gathered",
        "together",
        "unto",
        "one",
        "place,",
        "and",
        "let",
        "the",
        "dry",
        "*land",
        "appear:",
        "and",
        "it",
        "was",
        "so."
      ],
      "info": ""
    },
    {
      "verse": 10,
      "text": [
        "And",
        "God",
        "called",
        "the",
        "dry",
        "*land",
        "Earth;",
        "and",
        "the",
        "gathering",
        "together",
        "of",
        "the",
        "waters",
        "called",
        "he",
        "Seas:",
        "and",
        "God",
        "saw",
        "that",
        "*it",
        "*was",
        "good."
      ],
      "info": ""
    },
    {
      "verse": 11,
      "text": [
        "And",
        "God",
        "said,",
        "Let",
        "the",
        "earth",
        "bring",
        "forth",
        "grass,",
        "the",
        "herb",
        "yielding",
        "seed,",
        "*and",
        "the",
        "fruit",
        "tree",
        "yielding",
        "fruit",
        "after",
        "his",
        "kind,",
        "whose",
        "seed",
        "*is",
        "in",
        "itself,",
        "upon",
        "the",
        "earth:",
        "and",
        "it",
        "was",
        "so."
      ],
      "info": ""
    },
    {
      "verse": 12,
      "text": [
        "And",
        "the",
        "earth",
        "brought",
        "forth",
        "grass,",
        "*and",
        "herb",
        "yielding",
        "seed",
        "after",
        "his",
        "kind,",
        "and",
        "the",
        "tree",
        "yielding",
        "fruit,",
        "whose",
        "seed",
        "*was",
        "in",
        "itself,",
        "after",
        "his",
        "kind:",
        "and",
        "God",
        "saw",
        "that",
        "*it",
        "*was",
        "good."
      ],
      "info": ""
    },
    {
      "verse": 13,
      "text": [
        "And",
        "the",
        "evening",
        "and",
        "the",
        "morning",
        "were",
        "the",
        "third",
        "day."
      ],
      "info": ""
    },
    {
      "verse": 14,
      "text": [
        "¶",
        "And",
        "God",
        "said,",
        "Let",
        "there",
        "be",
        "lights",
        "in",
        "the",
        "firmament",
        "of",
        "the",
        "heaven",
        "to",
        "divide",
        "the",
        "day",
        "from",
        "the",
        "night;",
        "and",
        "let",
        "them",
        "be",
        "for",
        "signs,",
        "and",
        "for",
        "seasons,",
        "and",
        "for",
        "days,",
        "and",
        "years:"
      ],
      "info": ""
    },
    {
      "verse": 15,
      "text": [
        "And",
        "let",
        "them",
        "be",
        "for",
        "lights",
        "in",
        "the",
        "firmament",
        "of",
        "the",
        "heaven",
        "to",
        "give",
        "light",
        "upon",
        "the",
        "earth:",
        "and",
        "it",
        "was",
        "so."
      ],
      "info": ""
    },
    {
      "verse": 16,
      "text": [
        "And",
        "God",
        "made",
        "two",
        "great",
        "lights;",
        "the",
        "greater",
        "light",
        "to",
        "rule",
        "the",
        "day,",
        "and",
        "the",
        "lesser",
        "light",
        "to",
        "rule",
        "the",
        "night:",
        "*he",
        "*made",
        "the",
        "stars",
        "also."
      ],
      "info": ""
    },
    {
      "verse": 17,
      "text": [
        "And",
        "God",
        "set",
        "them",
        "in",
        "the",
        "firmament",
        "of",
        "the",
        "heaven",
        "to",
        "give",
        "light",
        "upon",
        "the",
        "earth,"
      ],
      "info": ""
    },
    {
      "verse": 18,
      "text": [
        "And",
        "to",
        "rule",
        "over",
        "the",
        "day",
        "and",
        "over",
        "the",
        "night,",
        "and",
        "to",
        "divide",
        "the",
        "light",
        "from",
        "the",
        "darkness:",
        "and",
        "God",
        "saw",
        "that",
        "*it",
        "*was",
        "good."
      ],
      "info": ""
    },
    {
      "verse": 19,
      "text": [
        "And",
        "the",
        "evening",
        "and",
        "the",
        "morning",
        "were",
        "the",
        "fourth",
        "day."
      ],
      "info": ""
    },
    {
      "verse": 20,
      "text": [
        "And",
        "God",
        "said,",
        "Let",
        "the",
        "waters",
        "bring",
        "forth",
        "abundantly",
        "the",
        "moving",
        "creature",
        "that",
        "hath",
        "life,",
        "and",
        "fowl",
        "*that",
        "may",
        "fly",
        "above",
        "the",
        "earth",
        "in",
        "the",
        "open",
        "firmament",
        "of",
        "heaven."
      ],
      "info": ""
    },
    {
      "verse": 21,
      "text": [
        "And",
        "God",
        "created",
        "great",
        "whales,",
        "and",
        "every",
        "living",
        "creature",
        "that",
        "moveth,",
        "which",
        "the",
        "waters",
        "brought",
        "forth",
        "abundantly,",
        "after",
        "their",
        "kind,",
        "and",
        "every",
        "winged",
        "fowl",
        "after",
        "his",
        "kind:",
        "and",
        "God",
        "saw",
        "that",
        "*it",
        "*was",
        "good."
      ],
      "info": ""
    },
    {
      "verse": 22,
      "text": [
        "And",
        "God",
        "blessed",
        "them,",
        "saying,",
        "Be",
        "fruitful,",
        "and",
        "multiply,",
        "and",
        "fill",
        "the",
        "waters",
        "in",
        "the",
        "seas,",
        "and",
        "let",
        "fowl",
        "multiply",
        "in",
        "the",
        "earth."
      ],
      "info": ""
    },
    {
      "verse": 23,
      "text": [
        "And",
        "the",
        "evening",
        "and",
        "the",
        "morning",
        "were",
        "the",
        "fifth",
        "day."
      ],
      "info": ""
    },
    {
      "verse": 24,
      "text": [
        "¶",
        "And",
        "God",
        "said,",
        "Let",
        "the",
        "earth",
        "bring",
        "forth",
        "the",
        "living",
        "creature",
        "after",
        "his",
        "kind,",
        "cattle,",
        "and",
        "creeping",
        "thing,",
        "and",
        "beast",
        "of",
        "the",
        "earth",
        "after",
        "his",
        "kind:",
        "and",
        "it",
        "was",
        "so."
      ],
      "info": ""
    },
    {
      "verse": 25,
      "text": [
        "And",
        "God",
        "made",
        "the",
        "beast",
        "of",
        "the",
        "earth",
        "after",
        "his",
        "kind,",
        "and",
        "cattle",
        "after",
        "their",
        "kind,",
        "and",
        "every",
        "thing",
        "that",
        "creepeth",
        "upon",
        "the",
        "earth",
        "after",
        "his",
        "kind:",
        "and",
        "God",
        "saw",
        "that",
        "*it",
        "*was",
        "good."
      ],
      "info": ""
    },
    {
      "verse": 26,
      "text": [
        "¶",
        "And",
        "God",
        "said,",
        "Let",
        "us",
        "make",
        "man",
        "in",
        "our",
        "image,",
        "after",
        "our",
        "likeness:",
        "and",
        "let",
        "them",
        "have",
        "dominion",
        "over",
        "the",
        "fish",
        "of",
        "the",
        "sea,",
        "and",
        "over",
        "the",
        "fowl",
        "of",
        "the",
        "air,",
        "and",
        "over",
        "the",
        "cattle,",
        "and",
        "over",
        "all",
        "the",
        "earth,",
        "and",
        "over",
        "every",
        "creeping",
        "thing",
        "that",
        "creepeth",
        "upon",
        "the",
        "earth."
      ],
      "info": ""
    },
    {
      "verse": 27,
      "text": [
        "So",
        "God",
        "created",
        "man",
        "in",
        "his",
        "*own",
        "image,",
        "in",
        "the",
        "image",
        "of",
        "God",
        "created",
        "he",
        "him;",
        "male",
        "and",
        "female",
        "created",
        "he",
        "them."
      ],
      "info": ""
    },
    {
      "verse": 28,
      "text": [
        "And",
        "God",
        "blessed",
        "them,",
        "and",
        "God",
        "said",
        "unto",
        "them,",
        "Be",
        "fruitful,",
        "and",
        "multiply,",
        "and",
        "replenish",
        "the",
        "earth,",
        "and",
        "subdue",
        "it:",
        "and",
        "have",
        "dominion",
        "over",
        "the",
        "fish",
        "of",
        "the",
        "sea,",
        "and",
        "over",
        "the",
        "fowl",
        "of",
        "the",
        "air,",
        "and",
        "over",
        "every",
        "living",
        "thing",
        "that",
        "moveth",
        "upon",
        "the",
        "earth."
      ],
      "info": ""
    },
    {
      "verse": 29,
      "text": [
        "¶",
        "And",
        "God",
        "said,",
        "Behold,",
        "I",
        "have",
        "given",
        "you",
        "every",
        "herb",
        "bearing",
        "seed,",
        "which",
        "*is",
        "upon",
        "the",
        "face",
        "of",
        "all",
        "the",
        "earth,",
        "and",
        "every",
        "tree,",
        "in",
        "the",
        "which",
        "*is",
        "the",
        "fruit",
        "of",
        "a",
        "tree",
        "yielding",
        "seed;",
        "to",
        "you",
        "it",
        "shall",
        "be",
        "for",
        "meat."
      ],
      "info": ""
    },
    {
      "verse": 30,
      "text": [
        "And",
        "to",
        "every",
        "beast",
        "of",
        "the",
        "earth,",
        "and",
        "to",
        "every",
        "fowl",
        "of",
        "the",
        "air,",
        "and",
        "to",
        "every",
        "thing",
        "that",
        "creepeth",
        "upon",
        "the",
        "earth,",
        "wherein",
        "*there",
        "*is",
        "life,",
        "*I",
        "*have",
        "*given",
        "every",
        "green",
        "herb",
        "for",
        "meat:",
        "and",
        "it",
        "was",
        "so."
      ],
      "info": ""
    },
    {
      "verse": 31,
      "text": [
        "And",
        "God",
        "saw",
        "every",
        "thing",
        "that",
        "he",
        "had",
        "made,",
        "and,",
        "behold,",
        "*it",
        "*was",
        "very",
        "good.",
        "And",
        "the",
        "evening",
        "and",
        "the",
        "morning",
        "were",
        "the",
        "sixth",
        "day."
      ],
      "info": ""
    }
  ]
}

  void getNext() {
    //current = WordPair.random();
    notifyListeners();
  }

  //var favorites = <WordPair>[];

  void toggleFavorite() {
    //if (favorites.contains(current)) {
      //favorites.remove(current);
    //} else {
    //  favorites.add(current);
    //}
    notifyListeners();
  }
}

class BibleReader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<BibleReaderState>();
    var pair = appState.currentChapter;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  //appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  //appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/*class VerseWidget extends StatelessWidget {
  final Map<String, dynamic> verseData = {
    "book_id": "GEN",
    "book_name": "Genesis",
    "chapter": 1,
    "header": "",
    "footer": "",
    "language": "English",
    "verses": [
      {
        "verse": 1,
        "text": [
          "In",
          "the",
          "beginning",
          "God",
          "created",
          "the",
          "heaven",
          "and",
          "the",
          "earth."
        ],
        "info": ""
      },
      {
        "verse": 2,
        "text": [
          "And",
          "the",
          "earth",
          "was",
          "without",
          "form,",
          "and",
          "void;",
          "and",
          "darkness",
          "*was",
          "upon",
          "the",
          "face",
          "of",
          "the",
          "deep.",
          "And",
          "the",
          "Spirit",
          "of",
          "God",
          "moved",
          "upon",
          "the",
          "face",
          "of",
          "the",
          "waters."
        ],
        "info": ""
      },
      {
        "verse": 3,
        "text": [
          "And",
          "God",
          "said,",
          "Let",
          "there",
          "be",
          "light:",
          "and",
          "there",
          "was",
          "light."
        ],
        "info": ""
      },
      {
        "verse": 4,
        "text": [
          "And",
          "God",
          "saw",
          "the",
          "light,",
          "that",
          "*it",
          "*was",
          "good:",
          "and",
          "God",
          "divided",
          "the",
          "light",
          "from",
          "the",
          "darkness."
        ],
        "info": ""
      },
      {
        "verse": 5,
        "text": [
          "And",
          "God",
          "called",
          "the",
          "light",
          "Day,",
          "and",
          "the",
          "darkness",
          "he",
          "called",
          "Night.",
          "And",
          "the",
          "evening",
          "and",
          "the",
          "morning",
          "were",
          "the",
          "first",
          "day."
        ],
        "info": ""
      },
      {
        "verse": 6,
        "text": [
          "¶",
          "And",
          "God",
          "said,",
          "Let",
          "there",
          "be",
          "a",
          "firmament",
          "in",
          "the",
          "midst",
          "of",
          "the",
          "waters,",
          "and",
          "let",
          "it",
          "divide",
          "the",
          "waters",
          "from",
          "the",
          "waters."
        ],
        "info": ""
      },
      {
        "verse": 7,
        "text": [
          "And",
          "God",
          "made",
          "the",
          "firmament,",
          "and",
          "divided",
          "the",
          "waters",
          "which",
          "*were",
          "under",
          "the",
          "firmament",
          "from",
          "the",
          "waters",
          "which",
          "*were",
          "above",
          "the",
          "firmament:",
          "and",
          "it",
          "was",
          "so."
        ],
        "info": ""
      },
      {
        "verse": 8,
        "text": [
          "And",
          "God",
          "called",
          "the",
          "firmament",
          "Heaven.",
          "And",
          "the",
          "evening",
          "and",
          "the",
          "morning",
          "were",
          "the",
          "second",
          "day."
        ],
        "info": ""
      },
      {
        "verse": 9,
        "text": [
          "¶",
          "And",
          "God",
          "said,",
          "Let",
          "the",
          "waters",
          "under",
          "the",
          "heaven",
          "be",
          "gathered",
          "together",
          "unto",
          "one",
          "place,",
          "and",
          "let",
          "the",
          "dry",
          "*land",
          "appear:",
          "and",
          "it",
          "was",
          "so."
        ],
        "info": ""
      },
      {
        "verse": 10,
        "text": [
          "And",
          "God",
          "called",
          "the",
          "dry",
          "*land",
          "Earth;",
          "and",
          "the",
          "gathering",
          "together",
          "of",
          "the",
          "waters",
          "called",
          "he",
          "Seas:",
          "and",
          "God",
          "saw",
          "that",
          "*it",
          "*was",
          "good."
        ],
        "info": ""
      },
      {
        "verse": 11,
        "text": [
          "And",
          "God",
          "said,",
          "Let",
          "the",
          "earth",
          "bring",
          "forth",
          "grass,",
          "the",
          "herb",
          "yielding",
          "seed,",
          "*and",
          "the",
          "fruit",
          "tree",
          "yielding",
          "fruit",
          "after",
          "his",
          "kind,",
          "whose",
          "seed",
          "*is",
          "in",
          "itself,",
          "upon",
          "the",
          "earth:",
          "and",
          "it",
          "was",
          "so."
        ],
        "info": ""
      },
      {
        "verse": 12,
        "text": [
          "And",
          "the",
          "earth",
          "brought",
          "forth",
          "grass,",
          "*and",
          "herb",
          "yielding",
          "seed",
          "after",
          "his",
          "kind,",
          "and",
          "the",
          "tree",
          "yielding",
          "fruit,",
          "whose",
          "seed",
          "*was",
          "in",
          "itself,",
          "after",
          "his",
          "kind:",
          "and",
          "God",
          "saw",
          "that",
          "*it",
          "*was",
          "good."
        ],
        "info": ""
      },
      {
        "verse": 13,
        "text": [
          "And",
          "the",
          "evening",
          "and",
          "the",
          "morning",
          "were",
          "the",
          "third",
          "day."
        ],
        "info": ""
      },
      {
        "verse": 14,
        "text": [
          "¶",
          "And",
          "God",
          "said,",
          "Let",
          "there",
          "be",
          "lights",
          "in",
          "the",
          "firmament",
          "of",
          "the",
          "heaven",
          "to",
          "divide",
          "the",
          "day",
          "from",
          "the",
          "night;",
          "and",
          "let",
          "them",
          "be",
          "for",
          "signs,",
          "and",
          "for",
          "seasons,",
          "and",
          "for",
          "days,",
          "and",
          "years:"
        ],
        "info": ""
      },
      {
        "verse": 15,
        "text": [
          "And",
          "let",
          "them",
          "be",
          "for",
          "lights",
          "in",
          "the",
          "firmament",
          "of",
          "the",
          "heaven",
          "to",
          "give",
          "light",
          "upon",
          "the",
          "earth:",
          "and",
          "it",
          "was",
          "so."
        ],
        "info": ""
      },
      {
        "verse": 16,
        "text": [
          "And",
          "God",
          "made",
          "two",
          "great",
          "lights;",
          "the",
          "greater",
          "light",
          "to",
          "rule",
          "the",
          "day,",
          "and",
          "the",
          "lesser",
          "light",
          "to",
          "rule",
          "the",
          "night:",
          "*he",
          "*made",
          "the",
          "stars",
          "also."
        ],
        "info": ""
      },
      {
        "verse": 17,
        "text": [
          "And",
          "God",
          "set",
          "them",
          "in",
          "the",
          "firmament",
          "of",
          "the",
          "heaven",
          "to",
          "give",
          "light",
          "upon",
          "the",
          "earth,"
        ],
        "info": ""
      },
      {
        "verse": 18,
        "text": [
          "And",
          "to",
          "rule",
          "over",
          "the",
          "day",
          "and",
          "over",
          "the",
          "night,",
          "and",
          "to",
          "divide",
          "the",
          "light",
          "from",
          "the",
          "darkness:",
          "and",
          "God",
          "saw",
          "that",
          "*it",
          "*was",
          "good."
        ],
        "info": ""
      },
      {
        "verse": 19,
        "text": [
          "And",
          "the",
          "evening",
          "and",
          "the",
          "morning",
          "were",
          "the",
          "fourth",
          "day."
        ],
        "info": ""
      },
      {
        "verse": 20,
        "text": [
          "And",
          "God",
          "said,",
          "Let",
          "the",
          "waters",
          "bring",
          "forth",
          "abundantly",
          "the",
          "moving",
          "creature",
          "that",
          "hath",
          "life,",
          "and",
          "fowl",
          "*that",
          "may",
          "fly",
          "above",
          "the",
          "earth",
          "in",
          "the",
          "open",
          "firmament",
          "of",
          "heaven."
        ],
        "info": ""
      },
      {
        "verse": 21,
        "text": [
          "And",
          "God",
          "created",
          "great",
          "whales,",
          "and",
          "every",
          "living",
          "creature",
          "that",
          "moveth,",
          "which",
          "the",
          "waters",
          "brought",
          "forth",
          "abundantly,",
          "after",
          "their",
          "kind,",
          "and",
          "every",
          "winged",
          "fowl",
          "after",
          "his",
          "kind:",
          "and",
          "God",
          "saw",
          "that",
          "*it",
          "*was",
          "good."
        ],
        "info": ""
      },
      {
        "verse": 22,
        "text": [
          "And",
          "God",
          "blessed",
          "them,",
          "saying,",
          "Be",
          "fruitful,",
          "and",
          "multiply,",
          "and",
          "fill",
          "the",
          "waters",
          "in",
          "the",
          "seas,",
          "and",
          "let",
          "fowl",
          "multiply",
          "in",
          "the",
          "earth."
        ],
        "info": ""
      },
      {
        "verse": 23,
        "text": [
          "And",
          "the",
          "evening",
          "and",
          "the",
          "morning",
          "were",
          "the",
          "fifth",
          "day."
        ],
        "info": ""
      },
      {
        "verse": 24,
        "text": [
          "¶",
          "And",
          "God",
          "said,",
          "Let",
          "the",
          "earth",
          "bring",
          "forth",
          "the",
          "living",
          "creature",
          "after",
          "his",
          "kind,",
          "cattle,",
          "and",
          "creeping",
          "thing,",
          "and",
          "beast",
          "of",
          "the",
          "earth",
          "after",
          "his",
          "kind:",
          "and",
          "it",
          "was",
          "so."
        ],
        "info": ""
      },
      {
        "verse": 25,
        "text": [
          "And",
          "God",
          "made",
          "the",
          "beast",
          "of",
          "the",
          "earth",
          "after",
          "his",
          "kind,",
          "and",
          "cattle",
          "after",
          "their",
          "kind,",
          "and",
          "every",
          "thing",
          "that",
          "creepeth",
          "upon",
          "the",
          "earth",
          "after",
          "his",
          "kind:",
          "and",
          "God",
          "saw",
          "that",
          "*it",
          "*was",
          "good."
        ],
        "info": ""
      },
      {
        "verse": 26,
        "text": [
          "¶",
          "And",
          "God",
          "said,",
          "Let",
          "us",
          "make",
          "man",
          "in",
          "our",
          "image,",
          "after",
          "our",
          "likeness:",
          "and",
          "let",
          "them",
          "have",
          "dominion",
          "over",
          "the",
          "fish",
          "of",
          "the",
          "sea,",
          "and",
          "over",
          "the",
          "fowl",
          "of",
          "the",
          "air,",
          "and",
          "over",
          "the",
          "cattle,",
          "and",
          "over",
          "all",
          "the",
          "earth,",
          "and",
          "over",
          "every",
          "creeping",
          "thing",
          "that",
          "creepeth",
          "upon",
          "the",
          "earth."
        ],
        "info": ""
      },
      {
        "verse": 27,
        "text": [
          "So",
          "God",
          "created",
          "man",
          "in",
          "his",
          "*own",
          "image,",
          "in",
          "the",
          "image",
          "of",
          "God",
          "created",
          "he",
          "him;",
          "male",
          "and",
          "female",
          "created",
          "he",
          "them."
        ],
        "info": ""
      },
      {
        "verse": 28,
        "text": [
          "And",
          "God",
          "blessed",
          "them,",
          "and",
          "God",
          "said",
          "unto",
          "them,",
          "Be",
          "fruitful,",
          "and",
          "multiply,",
          "and",
          "replenish",
          "the",
          "earth,",
          "and",
          "subdue",
          "it:",
          "and",
          "have",
          "dominion",
          "over",
          "the",
          "fish",
          "of",
          "the",
          "sea,",
          "and",
          "over",
          "the",
          "fowl",
          "of",
          "the",
          "air,",
          "and",
          "over",
          "every",
          "living",
          "thing",
          "that",
          "moveth",
          "upon",
          "the",
          "earth."
        ],
        "info": ""
      },
      {
        "verse": 29,
        "text": [
          "¶",
          "And",
          "God",
          "said,",
          "Behold,",
          "I",
          "have",
          "given",
          "you",
          "every",
          "herb",
          "bearing",
          "seed,",
          "which",
          "*is",
          "upon",
          "the",
          "face",
          "of",
          "all",
          "the",
          "earth,",
          "and",
          "every",
          "tree,",
          "in",
          "the",
          "which",
          "*is",
          "the",
          "fruit",
          "of",
          "a",
          "tree",
          "yielding",
          "seed;",
          "to",
          "you",
          "it",
          "shall",
          "be",
          "for",
          "meat."
        ],
        "info": ""
      },
      {
        "verse": 30,
        "text": [
          "And",
          "to",
          "every",
          "beast",
          "of",
          "the",
          "earth,",
          "and",
          "to",
          "every",
          "fowl",
          "of",
          "the",
          "air,",
          "and",
          "to",
          "every",
          "thing",
          "that",
          "creepeth",
          "upon",
          "the",
          "earth,",
          "wherein",
          "*there",
          "*is",
          "life,",
          "*I",
          "*have",
          "*given",
          "every",
          "green",
          "herb",
          "for",
          "meat:",
          "and",
          "it",
          "was",
          "so."
        ],
        "info": ""
      },
      {
        "verse": 31,
        "text": [
          "And",
          "God",
          "saw",
          "every",
          "thing",
          "that",
          "he",
          "had",
          "made,",
          "and,",
          "behold,",
          "*it",
          "*was",
          "very",
          "good.",
          "And",
          "the",
          "evening",
          "and",
          "the",
          "morning",
          "were",
          "the",
          "sixth",
          "day."
        ],
        "info": ""
      }
    ]
  };

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body:
      )
    });
  }
}
*/