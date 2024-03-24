import 'dart:io';

class Product {
  //properties
  String name;
  double price;

  //constructor
  Product(this.name, this.price);

  //a method to display product information
  void displayInfo(){
    print('Name: $name, Price: \KSh$price');
  }
}

// class 2: ElectronicProduct
class ElectronicProduct extends Product {
  String brand;

  ElectronicProduct(String name, double price, this.brand) : super(name, price);

  @override
  void displayInfo(){
    super.displayInfo(); // Call the parent's displayInfo method
    print('Brand: $brand');
  }
}

//class 3: inventory
class Inventory {
  List<Product> products = [];

  void loadProductsFromFile(String filePath) {
    var file = File(filePath);
    var lines = file.readAsLinesSync();

    for (var line in lines) {
      var parts = line.split(',');
      if (parts.length == 2) {
        // Regular product
        products.add(Product(parts[0], double.parse(parts[1])));
      } else if (parts.length == 3) {
        // Electronic product
        products.add(ElectronicProduct(parts[0], double.parse(parts[1]), parts[2]));
      }
    }
  }

// Method to iterate through products and display information using a loop
void displayInventory(){
  for(var product in products){
    product.displayInfo();
    print('---');
  }
 }
}

void main(){
  //instance
  var inventory = Inventory();
  inventory.loadProductsFromFile('products.txt');

  inventory.displayInventory();
}