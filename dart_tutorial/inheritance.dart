import 'classes.dart';

class NetworkElement {
  String name;
  String? alias;

  NetworkElement({
    required this.name,
    this.alias
  });

  void printDetails() {
    print('Name: $name');
    if (alias != null) {
      print('Alias: $alias');
    }
  }
}

class NWan extends NetworkElement {
  NWan({
    required super.name,
    super.alias,
  });

  @override
  void printDetails() => print('You are in the WAN network');
}

class NLan extends NetworkElement {
  // NLan({
  //   required super.name,
  //   super.alias,
  // });
  // Equivalent with positional parameters
  NLan(String name, [String? alias]) : super(name: name, alias: alias);
}

void main() {
  Wan wan = Wan('Wan', 'Wan Wan');
  wan.printDetails();

  Lan lan = Lan(name: 'Lan');
  lan.printDetails();

  NetworkElement ne = NetworkElement(name: 'Network Element');
  ne.printDetails();

  NWan nwan = NWan(name: 'NWan');
  nwan.printDetails();

  NLan nlan = NLan('NLan', 'NLan Lan');
  nlan.printDetails();
}