var name = "Flutter Dev";  // Type inferred as String
final age = 25;            // Immutable variable
const PI = 3.14;           // Compile-time constant

int count = 5;
double price = 10.5;
num total = count * price;
String message = "Hello, Dart!";
bool isValid = true;
List<String> fruits = ["Apple", "Banana", "Cherry"];
Map<String, int> scores = {"Alice": 90, "Bob": 85};

void main() {
  print("Name: $name, Age: $age, PI: $PI");

  print("Count: $count, Price: $price, Message: $message");

  print("isValid: $isValid, Fruits: $fruits, Scores: $scores");

  print("Total: $total");

  for (var fruit in fruits) {
    print("Fruit: $fruit");
  }

  scores.forEach((key, value) {
    print("Name: $key, Score: $value");
  });

  // Built-in List methods
  fruits.add("Date"); // Add an element to the end of the list
  print(fruits.length);
  fruits.insert(1, "Blueberry"); // Insert an element at a specific index
  print(fruits.contains("Apple")); // Check if an element exists in the list
  fruits.remove("Banana"); // Remove an element from the list
  fruits.removeAt(2); // Remove an element at a specific index
  print(fruits.isEmpty);// Check if the list is empty

  // Built-in Map methods
  scores.update("Alice", (value) => value + 5); // Update the value of an entry

  print(scores.keys);
  print(scores.values);

  scores.forEach((key, value) {
    print("Name: $key, Score: $value");
  });
}