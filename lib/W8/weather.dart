import 'package:flutter/material.dart';

enum Season { winter, spring, summer, autumn }

const String summer = 'assets/weather/Summer.jpg';
const String autumn = 'assets/weather/Autumn.jpg';
const String winter = 'assets/weather/Winter.jpg';
const String spring = 'assets/weather/Spring.jpg';

void main() => runApp(
  const MaterialApp(debugShowCheckedModeBanner: false, 
    home: SeasonCard()
  ),
);

class SeasonCard extends StatelessWidget {
  const SeasonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              const Text(
                "SEASONS",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    Expanded(child: CountrySeason(countryName: "FRANCE")),
                    SizedBox(width: 20),
                    Expanded(child: CountrySeason(countryName: "CAMBODIA")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CountrySeason extends StatefulWidget {
  final String countryName;

  const CountrySeason({super.key, required this.countryName});

  @override
  State<CountrySeason> createState() => _CountrySeasonState();
}

class _CountrySeasonState extends State<CountrySeason> {
  Season currentSeason = Season.winter;

  Image get seasonImage {
    switch (currentSeason) {
      case Season.winter:
        return Image.asset(winter, fit: BoxFit.cover);
      case Season.spring:
        return Image.asset(spring, fit: BoxFit.cover);
      case Season.summer:
        return Image.asset(summer, fit: BoxFit.cover);
      case Season.autumn:
        return Image.asset(autumn, fit: BoxFit.cover);
    }
  }

  void changeSeason() {
    setState(() {
      var nextSeasonIndex = (currentSeason.index + 1) % Season.values.length;
      currentSeason = Season.values[nextSeasonIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
      ),
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: changeSeason,
              child: SizedBox(width: double.infinity, child: seasonImage),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey, width: 2)),
            ),
            child: Center(
              child: Text(
                widget.countryName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
