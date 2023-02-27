class Strong {
  final double strength = 1500.99;
}

class QuickRunner {
  void runQuick() {
    print("run quick ----------");
  }
}

class Tall {
  final double height = 1.99;
}

enum Team { blue, red }

class Player with Strong, QuickRunner, Tall {
  final Team team;

  Player({
    required this.team,
  });
}

void main() {
  var player = Player(
    team: Team.red,
  );
  player.runQuick();
}
