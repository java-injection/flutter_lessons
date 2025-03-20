class User {
  final int id;
  final String name;
  final String surname;
  final int age;
  final String? soprannome;

  User({
    required this.id,
    required this.name,
    required this.surname,
    required this.age,
    this.soprannome,
  });

  void greet() {
    print("Hello $name");
  }

  @override
  String toString() => '''
    id: $id,
    name: $name,
    surname: $surname,
    age: $age,
    soprannome: ${soprannome ?? ""},
    ''';
}

void main() {
  User user = User(
    id: 9,
    age: 30,
    name: "Luca",
    surname: "Coraci",
  );

   print("provo a stampare tutto l'oggetto user2:\n$user");
}
