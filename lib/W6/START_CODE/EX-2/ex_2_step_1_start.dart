import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(
        children: [
          FavoriteCard(),
          FavoriteCard(),
          FavoriteCard(),
        ],
      ),
    ),
  ),
);

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({super.key});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isFavorite = false;

  Icon get icon => Icon(isFavorite ? Icons.favorite : Icons.favorite_border);

  Color get iconColor => isFavorite ? Colors.red : Colors.grey;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("title", style: TextStyle(color: Colors.blue)),
                Text("description", style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
          IconButton(
            onPressed: toggleFavorite,
            icon: icon,
            color: iconColor,
          ),
        ],
      ),
    );
  }
}
