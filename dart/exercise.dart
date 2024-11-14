class NetworkElement {
  String id;
  int volume;
  String name;

  NetworkElement({
    required this.id,
    required this.volume,
    required this.name
  });
  // @override
  // String toString() => 'NetworkElement(id: $id, volume: $volume, name: $name)';
}

List<NetworkElement> listOne = [
  NetworkElement(id: '1', volume: 100, name: 'Element 1'),
  NetworkElement(id: '2', volume: 200, name: 'Element 2'),
  NetworkElement(id: '3', volume: 300, name: 'Element 3'),
];

List<NetworkElement> listTwo = [
  NetworkElement(id: '4', volume: 100, name: 'Element 4'),
  NetworkElement(id: '5', volume: 300, name: 'Element 5'),
  NetworkElement(id: '6', volume: 600, name: 'Element 6'),
];

List<NetworkElement> combineAndSort(List<NetworkElement> list1, List<NetworkElement> list2, bool ascending, String key) {
  // List<NetworkElement> combinedList = [...list1, ...list2];
  List<NetworkElement> combinedList = {...list1, ...list2}.toList();
  // a[key] or b[key] not working :( so using switch case
  switch (key) {
    case 'volume':
      combinedList.sort((a, b) =>
          ascending ? a.volume.compareTo(b.volume) : b.volume.compareTo(a.volume));
      break;
    case 'name':
      combinedList.sort((a, b) =>
          ascending ? a.name.compareTo(b.name) : b.name.compareTo(a.name));
      break;
    case 'id':
    default:
      combinedList.sort((a, b) =>
          ascending ? a.id.compareTo(b.id) : b.id.compareTo(a.id));
  }
  return combinedList;
}
void main() {
  List<NetworkElement> sortedList = combineAndSort(listOne, listTwo, false, 'volume');
  for (var element in sortedList) {
    print('ID: ${element.id}, Volume: ${element.volume}, Name: ${element.name}');
    // print(element.toString());
  }
}