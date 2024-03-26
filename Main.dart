import 'dart:io';

// Interface for animal
abstract class Animal {
  void makeSound();
}

// Base class
class AnimalBase implements Animal {
  String _name;

  AnimalBase(this._name);

  @override
  void makeSound() {
    print("$_name makes a sound");
  }
}

// Derived class overriding the makeSound method
class Dog extends AnimalBase {
  Dog(String name) : super(name);

  @override
  void makeSound() {
    print("$_name barks");
  }
}

// Class that implements an interface
class Cat implements Animal {
  String _name;

  Cat(this._name);

  @override
  void makeSound() {
    print("$_name meows");
  }
}

// Class with a method to read data from a file and initialize an instance
class AnimalInitializer {
  Animal initializeFromFile(String filename) {
    final file = File(filename);
    List<String> lines = file.readAsLinesSync();
    return Dog(lines[0]); // Assuming the first line contains the name of the dog
  }
}

void main() {
  // Demonstrating object creation and method invocation
  var dog = Dog('Buddy');
  var cat = Cat('Whiskers');

  dog.makeSound();
  cat.makeSound();

  // Demonstrating the use of a loop
  AnimalInitializer animalInitializer = AnimalInitializer();
  var initializedAnimal = animalInitializer.initializeFromFile('data.txt');
  initializedAnimal.makeSound();
}
