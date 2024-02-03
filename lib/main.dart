import 'package:flutter/material.dart';
import 'package:examen_20220230_1/juegos.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController(initialPage: 3);
  int _selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Today", style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold)),
                const SizedBox(width: 8.0),
                Text("February", style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold)),
              ],
            ),
            Text("February", style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.grey)),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: const [
          PaginaToday(),
          PaginaGames(),
          PaginaApps(),
          PaginaAcrode(),
          PaginaSearch(),
        ],
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.access_time,
            color: Colors.grey,
          ),
          label: 'Today',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.games,
            color: Colors.grey,
          ),
          label: 'Games',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.apps,
            color: Colors.grey,
          ),
          label: 'Apps',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.videogame_asset,
            color: Colors.grey,
          ),
          label: 'Arcade',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          label: 'Search',
        ),
      ],
      selectedItemColor: const Color.fromARGB(255, 160, 160, 160),
      currentIndex: _selectedIndex,
      onTap: (index) {
        _pageController.animateToPage(index,
            duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
      },
    );
  }
}

class PaginaToday extends StatelessWidget {
  const PaginaToday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = MediaQuery.of(context).size.width;
        int columns = screenWidth > 600 ? 4 : 1;
        double cardWidth = screenWidth / columns - 16;
        double cardHeight = cardWidth * 1.0; // Ajusta este valor para cambiar la altura de las tarjetas

        // Ajustar tamaños para pantallas pequeñas
        if (screenWidth < 600) {
          cardWidth = screenWidth - 32;
          cardHeight = cardWidth * 0.5; // Reducir la altura para pantallas pequeñas
        }

        double verticalSpacing = screenWidth < 600 ? 20.0 : 12.0; // Aumenté el espacio vertical
        double verticalSpacingSmallScreen = 10.0; // Espacio vertical adicional para pantallas pequeñas

        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white, // Fondo blanco
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ],
                ),
              ),
              ..._buildCards(columns, cardWidth, cardHeight, screenWidth, verticalSpacing, verticalSpacingSmallScreen),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildCards(int columns, double cardWidth, double cardHeight, double screenWidth, double verticalSpacing, double verticalSpacingSmallScreen) {
    List<Widget> cards = [];

    List<String> gameUrls = [
      'https://th.bing.com/th/id/OIP.49STXrinKsjom5mY_3CphAHaFX?w=229&h=180&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.6k9cUDkmZVT3QE_U8jcldwHaEK?w=313&h=181&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.Lzn_7Hq5ntwCf65mWMpuwwAAAA?w=313&h=180&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP._IJp-F2X6OL9keSAAdScUgHaHa?w=182&h=182&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.oJBSXNi3_LYwvLxVs9_vHwHaEK?w=290&h=180&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.HyUcG5VSnrWZ_0y7Aeea4AHaHa?w=153&h=180&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.0G7Ra92KNeCp9DpSW4uz4gHaHa?w=190&h=190&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.9ITdQR4hKRsgOXAQMRXz-wHaHa?w=155&h=180&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.s-yvHlbOznWnOsmxDIZc4wHaEK?w=292&h=180&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.PAtSluKcOR1Qp1gLPpSaNAAAAA?w=167&h=180&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.e62uIti__6ai-bXs6quo-wHaE9?w=257&h=180&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.zrA97swiCxbbZ49AOT5iFAHaDt?w=334&h=175&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.M-mAdUHm7uP2524BoSQXDgHaHa?w=184&h=185&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.xAPgO13HfwAN_p61HT5fygHaNK?w=187&h=333&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.09tY7uRVKr25QIppiI_0RAHaD4?w=329&h=180&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.Em7E69qLzZSS9ZP_UnhdPAHaE8?w=273&h=182&c=7&r=0&o=5&pid=1.7',
    ];

    List<String> gameNames = [
      'Call Of Duty III',
      'Amazon',
      'Whatsapp',
      'Facebook',
      'Resident Evil II',
      'Resident Evil IV',
      'Candy Crush',
      'Clash Royale',
      'Tinder',
      'Instagram',
      'X',
      'Spotify',
      'Telegram',
      'Subway Surfers',
      'FIFA 23',
      'Tik Tok',
    ];

    int rows = (gameUrls.length / columns).ceil();

    for (int i = 0; i < rows; i++) {
      List<Widget> rowChildren = [];
      for (int j = 0; j < columns; j++) {
        int index = i * columns + j;
        if (index < gameUrls.length) {
          rowChildren.add(_buildCard(gameUrls[index], gameNames[index], cardWidth, cardHeight, screenWidth));
        }
      }
      cards.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: rowChildren,
        ),
      );
      if (i < rows - 1 && columns > 1) {
        double spacing = screenWidth < 600 ? verticalSpacingSmallScreen : verticalSpacing;
        cards.add(SizedBox(height: spacing));
      }
    }

    return cards;
  }

  Widget _buildCard(String imageUrl, String title, double cardWidth, double cardHeight, double screenWidth) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          _onCardTapped(title);
        },
        child: Container(
          width: cardWidth,
          height: cardHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.transparent,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth < 600 ? 16 : 14, // Ajusta el tamaño del texto para pantallas pequeñas
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onCardTapped(String title) {
    // Aquí puedes manejar la acción cuando se toca una tarjeta
    print('Card Tapped: $title');
  }
}

class PaginaGames extends StatelessWidget {
  const PaginaGames({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = MediaQuery.of(context).size.width;
        int columns = screenWidth > 600 ? 4 : 1;
        double cardWidth = screenWidth / columns - 16;
        double cardHeight = cardWidth * 1.0; // Ajusta este valor para cambiar la altura de las tarjetas

        // Ajustar tamaños para pantallas pequeñas
        if (screenWidth < 600) {
          cardWidth = screenWidth - 32;
          cardHeight = cardWidth * 0.5; // Reducir la altura para pantallas pequeñas
        }

        double verticalSpacing = screenWidth < 600 ? 20.0 : 12.0; // Aumenté el espacio vertical
        double verticalSpacingSmallScreen = 10.0; // Espacio vertical adicional para pantallas pequeñas

        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white, // Fondo blanco
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ],
                ),
              ),
              ..._buildCards(columns, cardWidth, cardHeight, screenWidth, verticalSpacing, verticalSpacingSmallScreen),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildCards(int columns, double cardWidth, double cardHeight, double screenWidth, double verticalSpacing, double verticalSpacingSmallScreen) {
    List<Widget> cards = [];

    List<String> gameUrls = [
      'https://th.bing.com/th/id/OIP.49STXrinKsjom5mY_3CphAHaFX?w=229&h=180&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.oJBSXNi3_LYwvLxVs9_vHwHaEK?w=290&h=180&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.HyUcG5VSnrWZ_0y7Aeea4AHaHa?w=153&h=180&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.0G7Ra92KNeCp9DpSW4uz4gHaHa?w=190&h=190&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.9ITdQR4hKRsgOXAQMRXz-wHaHa?w=155&h=180&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.xAPgO13HfwAN_p61HT5fygHaNK?w=187&h=333&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.09tY7uRVKr25QIppiI_0RAHaD4?w=329&h=180&c=7&r=0&o=5&pid=1.7',
    ];

    List<String> gameNames = [
      'Call Of Duty III',
      'Resident Evil II',
      'Resident Evil IV',
      'Candy Crush',
      'Clash Royale',
      'Subway Surfers',
      'FIFA 23',
    ];

    int rows = (gameUrls.length / columns).ceil();

    for (int i = 0; i < rows; i++) {
      List<Widget> rowChildren = [];
      for (int j = 0; j < columns; j++) {
        int index = i * columns + j;
        if (index < gameUrls.length) {
          rowChildren.add(_buildCard(gameUrls[index], gameNames[index], cardWidth, cardHeight, screenWidth));
        }
      }
      cards.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: rowChildren,
        ),
      );
      if (i < rows - 1 && columns > 1) {
        double spacing = screenWidth < 600 ? verticalSpacingSmallScreen : verticalSpacing;
        cards.add(SizedBox(height: spacing));
      }
    }

    return cards;
  }

  Widget _buildCard(String imageUrl, String title, double cardWidth, double cardHeight, double screenWidth) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          _onCardTapped(title);
        },
        child: Container(
          width: cardWidth,
          height: cardHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.transparent,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth < 600 ? 16 : 14, // Ajusta el tamaño del texto para pantallas pequeñas
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onCardTapped(String title) {
    // Aquí puedes manejar la acción cuando se toca una tarjeta
    print('Card Tapped: $title');
  }
}

class PaginaApps extends StatelessWidget {
  const PaginaApps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = MediaQuery.of(context).size.width;
        int columns = screenWidth > 600 ? 4 : 1;
        double cardWidth = screenWidth / columns - 16;
        double cardHeight = cardWidth * 1.0; // Ajusta este valor para cambiar la altura de las tarjetas

        // Ajustar tamaños para pantallas pequeñas
        if (screenWidth < 600) {
          cardWidth = screenWidth - 32;
          cardHeight = cardWidth * 0.5; // Reducir la altura para pantallas pequeñas
        }

        double verticalSpacing = screenWidth < 600 ? 20.0 : 12.0; // Aumenté el espacio vertical
        double verticalSpacingSmallScreen = 10.0; // Espacio vertical adicional para pantallas pequeñas

        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white, // Fondo blanco
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ],
                ),
              ),
              ..._buildCards(columns, cardWidth, cardHeight, screenWidth, verticalSpacing, verticalSpacingSmallScreen),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildCards(int columns, double cardWidth, double cardHeight, double screenWidth, double verticalSpacing, double verticalSpacingSmallScreen) {
    List<Widget> cards = [];

    List<String> appUrls = [
      'https://th.bing.com/th/id/OIP.6k9cUDkmZVT3QE_U8jcldwHaEK?w=313&h=181&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.Lzn_7Hq5ntwCf65mWMpuwwAAAA?w=313&h=180&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP._IJp-F2X6OL9keSAAdScUgHaHa?w=182&h=182&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.s-yvHlbOznWnOsmxDIZc4wHaEK?w=292&h=180&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.PAtSluKcOR1Qp1gLPpSaNAAAAA?w=167&h=180&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.e62uIti__6ai-bXs6quo-wHaE9?w=257&h=180&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.zrA97swiCxbbZ49AOT5iFAHaDt?w=334&h=175&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.M-mAdUHm7uP2524BoSQXDgHaHa?w=184&h=185&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.Em7E69qLzZSS9ZP_UnhdPAHaE8?w=273&h=182&c=7&r=0&o=5&pid=1.7',
    ];

    List<String> appNames = [
      'Amazon',
      'Whatsapp',
      'Facebook',
      'Tinder',
      'Instagram',
      'X',
      'Spotify',
      'Telegram',
      'Tik Tok',
    ];

    int rows = (appUrls.length / columns).ceil();

    for (int i = 0; i < rows; i++) {
      List<Widget> rowChildren = [];
      for (int j = 0; j < columns; j++) {
        int index = i * columns + j;
        if (index < appUrls.length) {
          rowChildren.add(_buildCard(appUrls[index], appNames[index], cardWidth, cardHeight, screenWidth));
        }
      }
      cards.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: rowChildren,
        ),
      );
      if (i < rows - 1 && columns > 1) {
        double spacing = screenWidth < 600 ? verticalSpacingSmallScreen : verticalSpacing;
        cards.add(SizedBox(height: spacing));
      }
    }

    return cards;
  }

  Widget _buildCard(String imageUrl, String title, double cardWidth, double cardHeight, double screenWidth) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          _onCardTapped(title);
        },
        child: Container(
          width: cardWidth,
          height: cardHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.transparent,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth < 600 ? 16 : 14, // Ajusta el tamaño del texto para pantallas pequeñas
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onCardTapped(String title) {
    // Aquí puedes manejar la acción cuando se toca una tarjeta
    print('Card Tapped: $title');
  }
}

class PaginaAcrode extends StatelessWidget {
  const PaginaAcrode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Soy la página de Arcade'),
    );
  }
}



class _PaginaSearchState extends State<PaginaSearch> {
  TextEditingController _searchController = TextEditingController();

  List<Map<String, String>> filteredResults = [];

  // URLs de juegos
  List<String> gameUrls = [
      'https://th.bing.com/th/id/OIP.49STXrinKsjom5mY_3CphAHaFX?w=229&h=180&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.6k9cUDkmZVT3QE_U8jcldwHaEK?w=313&h=181&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.Lzn_7Hq5ntwCf65mWMpuwwAAAA?w=313&h=180&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP._IJp-F2X6OL9keSAAdScUgHaHa?w=182&h=182&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.oJBSXNi3_LYwvLxVs9_vHwHaEK?w=290&h=180&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.HyUcG5VSnrWZ_0y7Aeea4AHaHa?w=153&h=180&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.0G7Ra92KNeCp9DpSW4uz4gHaHa?w=190&h=190&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.9ITdQR4hKRsgOXAQMRXz-wHaHa?w=155&h=180&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.s-yvHlbOznWnOsmxDIZc4wHaEK?w=292&h=180&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.PAtSluKcOR1Qp1gLPpSaNAAAAA?w=167&h=180&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.e62uIti__6ai-bXs6quo-wHaE9?w=257&h=180&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.zrA97swiCxbbZ49AOT5iFAHaDt?w=334&h=175&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.M-mAdUHm7uP2524BoSQXDgHaHa?w=184&h=185&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.xAPgO13HfwAN_p61HT5fygHaNK?w=187&h=333&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.09tY7uRVKr25QIppiI_0RAHaD4?w=329&h=180&c=7&r=0&o=5&pid=1.7',
      'https://th.bing.com/th/id/OIP.Em7E69qLzZSS9ZP_UnhdPAHaE8?w=273&h=182&c=7&r=0&o=5&pid=1.7',
  ];

  // Nombres de juegos
  List<String> gameNames = [
    'Call Of Duty III',
    'Amazon',
    'Whatsapp',
    'Facebook',
    'Resident Evil II',
    'Resident Evil IV',
    'Candy Crush',
    'Clash Royale',
    'Tinder',
    'Instagram',
    'X',
    'Spotify',
    'Telegram',
    'Subway Surfers',
    'FIFA 23',
    'Tik Tok',
    // ... Agrega más nombres según sea necesario
  ];

  @override
  void initState() {
    super.initState();
    // Inicializamos filteredResults con todos los resultados al inicio
    filteredResults = _filterResults('');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Search',
              suffixIcon: Icon(Icons.search),
            ),
            onChanged: (query) {
              setState(() {
                filteredResults = _filterResults(query);
              });
            },
          ),
          const SizedBox(height: 16.0),
          ListView.builder(
            shrinkWrap: true,
            itemCount: filteredResults.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: _buildCard(filteredResults[index]),
              );
            },
          ),
        ],
      ),
    );
  }

  List<Map<String, String>> _filterResults(String query) {
    List<Map<String, String>> results = [];
    for (int i = 0; i < gameUrls.length; i++) {
      if (gameNames[i].toLowerCase().contains(query.toLowerCase())) {
        results.add({
          'name': gameNames[i],
          'imageUrl': gameUrls[i],
          'url': gameUrls[i],
        });
      }
    }
    return results;
  }

  Widget _buildCard(Map<String, String> result) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: NetworkImage(result['imageUrl']!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  result['name']!,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  result['url']!,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
