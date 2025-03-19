class User {
  final int id;
  final String name;
  final int age;
  final String? soprannome;

  User({
    required this.id,
    required this.name,
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
    age: $age,
    soprannome: ${soprannome ?? ""},
    ''';
}

void main() {
  User user = User(
    id: 9,
    age: 30,
    name: "Luca",
  );

   print("provo a stampare tutto l'oggetto user2:\n$user");
}
