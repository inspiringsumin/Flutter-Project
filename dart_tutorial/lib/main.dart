import 'dart:async';
import 'dart:io';

class Spacecraft {
  String name;
  DateTime? launchDate;

  Spacecraft(this.name, this.launchDate) {
    name = name + '님';
  }

  Spacecraft.unlaunched(String name) : this(name, null);

  int? get launchYear => launchDate?.year;

  void describe() {
    print('Spacecraft: $name');

    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

class Orbiter extends Spacecraft {
  num altitude;
  Orbiter(String name, DateTime launchDate, this.altitude) : super(name, launchDate);

  @override
  void describe() {
    print('고도');
    super.describe();
    print('altitude: $altitude');
  }
}

class Piloted {
  int astronauts = 1;
  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

class MockSpaceship implements Spacecraft {
  @override
  DateTime? launchDate;

  @override
  String name;

  MockSpaceship(this.launchDate, this.name);

  @override
  void describe() {
    // TODO: implement describe
  }

  @override
  // TODO: implement launchYear
  int? get launchYear => throw UnimplementedError();
}

abstract class Describable {
  void descirbe();

  void describeWithEmphasis() {
    print("==============");
    descirbe();
    print("============");
  }
}

class Unit extends Describable {
  @override
  void descirbe() {
    print("unit");
  }
}

class Animal implements Describable {
  @override
  void descirbe() {
    print('describe');
  }

  @override
  void describeWithEmphasis() {
    print('describeQ');
  }
}

var oneSecond = Duration(seconds: 1);
Stream<String> report(Spacecraft craft, Iterable<String> objects) async* {
  for (var object in objects) {
    await Future.delayed(oneSecond);
    yield '${craft.name} flies by $object';
  }
}

void main() async {
  var flybyObjects = ['abc', 'def'];
  try {
    for (final object in flybyObjects) {
      var description = await File('$object.txt').readAsString();
      print(description);
    }
  } on IOException catch (e) {
    print('Could not describe object: $e');
  } finally {
    flybyObjects.clear();
  }
}
