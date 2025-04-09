import 'package:flutter/material.dart';

void main() => runApp(FootballPointsApp());

class FootballPointsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Points Table',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.dark(
          primary: Colors.purple,
          secondary: Colors.cyanAccent,
        ),
      ),
      home: PointsTableScreen(),
    );
  }
}

class Team {
  final String name;
  final String logoUrl;
  final int played, won, drawn, lost, points;

  Team({
    required this.name,
    required this.logoUrl,
    required this.played,
    required this.won,
    required this.drawn,
    required this.lost,
    required this.points,
  });
}

final List<Team> teams = [
   Team(name: 'Real Madrid', logoUrl: 'https://upload.wikimedia.org/wikipedia/en/5/56/Real_Madrid_CF.svg', played: 30, won: 23, drawn: 5, lost: 3, points: 74),
  Team(name: 'Manchester City', logoUrl: 'https://upload.wikimedia.org/wikipedia/en/e/eb/Manchester_City_FC_badge.svg', played: 30, won: 22, drawn: 5, lost: 3, points: 71),
  Team(name: 'Arsenal', logoUrl: 'https://upload.wikimedia.org/wikipedia/en/5/53/Arsenal_FC.svg', played: 30, won: 21, drawn: 6, lost: 3, points: 69),
  Team(name: 'Liverpool', logoUrl: 'https://upload.wikimedia.org/wikipedia/en/0/0c/Liverpool_FC.svg', played: 30, won: 20, drawn: 8, lost: 2, points: 68),
  Team(name: 'Barcelona', logoUrl: 'https://upload.wikimedia.org/wikipedia/en/4/47/FC_Barcelona_%28crest%29.svg', played: 30, won: 19, drawn: 7, lost: 4, points: 64),
  Team(name: 'PSG', logoUrl: 'https://upload.wikimedia.org/wikipedia/en/a/a7/Paris_Saint-Germain_F.C..svg', played: 30, won: 22, drawn: 3, lost: 5, points: 69),
  Team(name: 'Bayern Munich', logoUrl: 'https://upload.wikimedia.org/wikipedia/en/1/1f/FC_Bayern_München_logo_%282017%29.svg', played: 30, won: 20, drawn: 6, lost: 4, points: 66),
  Team(name: 'Juventus', logoUrl: 'https://upload.wikimedia.org/wikipedia/commons/1/15/Juventus_FC_2017_logo.svg', played: 30, won: 18, drawn: 7, lost: 5, points: 61),
  Team(name: 'Chelsea', logoUrl: 'https://upload.wikimedia.org/wikipedia/en/c/cc/Chelsea_FC.svg', played: 30, won: 14, drawn: 9, lost: 7, points: 51),
  Team(name: 'AC Milan', logoUrl: 'https://upload.wikimedia.org/wikipedia/commons/d/d0/Logo_of_AC_Milan.svg', played: 30, won: 17, drawn: 8, lost: 5, points: 59),
  Team(name: 'Inter Milan', logoUrl: 'https://upload.wikimedia.org/wikipedia/en/0/05/Inter_Milan.svg', played: 30, won: 19, drawn: 5, lost: 6, points: 62),
  Team(name: 'Atletico Madrid', logoUrl: 'https://upload.wikimedia.org/wikipedia/en/f/f4/Atletico_Madrid_2017_logo.svg', played: 30, won: 17, drawn: 9, lost: 4, points: 60),
  Team(name: 'Tottenham', logoUrl: 'https://upload.wikimedia.org/wikipedia/en/b/b4/Tottenham_Hotspur.svg', played: 30, won: 16, drawn: 7, lost: 7, points: 55),
  Team(name: 'Napoli', logoUrl: 'https://upload.wikimedia.org/wikipedia/commons/2/2d/SSC_Napoli.svg', played: 30, won: 15, drawn: 10, lost: 5, points: 55),
  Team(name: 'Borussia Dortmund', logoUrl: 'https://upload.wikimedia.org/wikipedia/commons/6/67/Borussia_Dortmund_logo.svg', played: 30, won: 16, drawn: 8, lost: 6, points: 56),
  Team(name: 'Ajax', logoUrl: 'https://upload.wikimedia.org/wikipedia/en/7/79/Ajax_Amsterdam.svg', played: 30, won: 18, drawn: 6, lost: 6, points: 60),
  Team(name: 'Benfica', logoUrl: 'https://upload.wikimedia.org/wikipedia/en/8/89/SL_Benfica_logo.svg', played: 30, won: 19, drawn: 5, lost: 6, points: 62),
  Team(name: 'Porto', logoUrl: 'https://upload.wikimedia.org/wikipedia/en/f/f1/FC_Porto.svg', played: 30, won: 17, drawn: 7, lost: 6, points: 58),
];

class PointsTableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Europen Points Table Football',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.purple.shade900,
      ),
      body: ListView.separated(
        itemCount: teams.length,
        separatorBuilder: (_, __) => Divider(color: Colors.grey.shade800),
        itemBuilder: (context, index) {
          final team = teams[index];
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            dense: true,
            leading: CircleAvatar(
              backgroundImage: NetworkImage(team.logoUrl),
              radius: 18,
              backgroundColor: Colors.transparent,
            ),
            title: Text(team.name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.cyanAccent)),
            subtitle: Text("Points: ${team.points}", style: TextStyle(fontSize: 12)),
            trailing: Icon(Icons.sports_soccer, size: 16, color: Colors.purpleAccent),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TeamDetailScreen(team: team),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class TeamDetailScreen extends StatelessWidget {
  final Team team;

  const TeamDetailScreen({super.key, required this.team});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(team.name),
        backgroundColor: Colors.purple.shade800,
      ),
      body: Stack(
        children: [
          Container(color: Colors.black),
          Positioned.fill(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(team.logoUrl),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(height: 20),
                  Text(team.name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.purpleAccent)),
                  SizedBox(height: 30),
                  StatRow(label: 'Matches Played', value: team.played),
                  StatRow(label: 'Wins', value: team.won),
                  StatRow(label: 'Draws', value: team.drawn),
                  StatRow(label: 'Losses', value: team.lost),
                  Divider(height: 30, color: Colors.purple),
                  StatRow(label: 'Total Points', value: team.points),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StatRow extends StatelessWidget {
  final String label;
  final int value;

  const StatRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Expanded(child: Text(label, style: TextStyle(fontSize: 16, color: Colors.cyanAccent))),
          Text('$value', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
