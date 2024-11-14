class Wan {
  String name;
  String? alias;

  Wan(this.name, this.alias); // Constructor pointing to the class properties

  String get displayName => alias ?? name; // Getter method with "lambda" expression

  void printDetails() {
    print("Display name: $displayName");
  }
}

class Lan {
  String name;
  String? alias;

  Lan({
    required this.name,
    this.alias
  }); // Named constructor pointing to the class properties

  String get displayName => alias ?? name; // Getter method with "lambda" expression

  void printDetails() {
    print('Display name: $displayName');
  }
}

void main() {
  Wan wan = Wan('Wan', 'Wan Wan');
  wan.printDetails();

  Lan lan = Lan(name: 'Lan');
  lan.printDetails();
}