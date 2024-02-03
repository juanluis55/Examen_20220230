import 'package:flutter/material.dart';
import 'package:examen_20220230_1/main.dart';

class PaginaSearch extends StatefulWidget {
  const PaginaSearch({Key? key}) : super(key: key);

  @override
  _PaginaSearchState createState() => _PaginaSearchState();
}

class _PaginaSearchState extends State<PaginaSearch> {
  TextEditingController _searchController = TextEditingController();

  // Lista de resultados de búsqueda (puedes cambiar esto según tus necesidades)
  List<String> searchResults = [];

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
    // ... (agrega más nombres de juegos según sea necesario)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchBar(),
            const SizedBox(height: 16.0),
            _buildSearchResults(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search...',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        ElevatedButton(
          onPressed: () {
            _performSearch();
          },
          child: Text('Search'),
        ),
      ],
    );
  }

  void _performSearch() {
    String searchTerm = _searchController.text.toLowerCase();
  
    setState(() {
      searchResults = gameNames.where((game) => game.toLowerCase().contains(searchTerm)).toList();
    });
  }

  Widget _buildSearchResults() {
    // Verificamos si hay resultados de búsqueda antes de mostrarlos
    if (searchResults.isNotEmpty) {
      return Expanded(
        child: ListView.builder(
          itemCount: searchResults.length,
          itemBuilder: (context, index) {
            // Puedes personalizar esta tarjeta según tus necesidades
            return Card(
              elevation: 0,
              child: ListTile(
                title: Text(searchResults[index]),
                // Agrega cualquier acción que desees cuando se toque una tarjeta
                onTap: () {
                  _onResultTapped(searchResults[index]);
                },
              ),
            );
          },
        ),
      );
    } else {
      // Mensaje cuando no hay resultados de búsqueda
      return Container(
        child: Text('No results found.'),
      );
    }
  }

  void _onResultTapped(String result) {
    // Aquí puedes manejar la acción cuando se toca un resultado de búsqueda
    print('Result Tapped: $result');
  }
}
