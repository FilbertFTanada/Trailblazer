import 'package:flutter/material.dart';

class coffeeDetail {
  String nameDetail;
  String image;
  String desc;
  String price;

  coffeeDetail({
    required this.nameDetail,
    required this.image,
    required this.desc,
    required this.price,
  });
}

class coffeeType {
  String name;
  List<coffeeDetail> detail;

  coffeeType({
    required this.name,
    required this.detail,
  });
}

class CoffeeNewProvider extends ChangeNotifier {
  List<coffeeType> coffee = [
    coffeeType(
      name: "Cappucino",
      detail: [
        coffeeDetail(
          nameDetail: "with Chocolate",
          image:
              "https://ayomakan.oss-ap-southeast-5.aliyuncs.com/article/ARTICLE-AYOMAKAN_20231103140453.jpg",
          desc:
              '"Cappuccino with Chocolate" is a delightful fusion of two beloved flavors - the rich, robust taste of classic cappuccino combined with the indulgent sweetness of chocolate. This harmonious blend creates a unique and satisfying beverage that appeals to both coffee enthusiasts and chocolate lovers alike.',
          price: "\$ 4.10",
        ),
        coffeeDetail(
          nameDetail: "with Oat Milk",
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTe5ymotTjjGDNDidHvPNmhlVgB2qwQmgJreQ&s",
          desc:
              '"Cappuccino with oat milk" is a delightful twist on the classic cappuccino, offering a harmonious blend of rich espresso and creamy oat milk. This beverage starts with a foundation of finely brewed espresso, renowned for its bold and robust flavor profile. The addition of oat milk brings a velvety texture and a subtle sweetness that perfectly complements the espressos intensity.',
          price: "\$ 3.99",
        ),
        coffeeDetail(
          nameDetail: "with Tea",
          image:
              "https://images.squarespace-cdn.com/content/v1/57c3b7ecb3db2b6d36105e34/1530303651390-9M3O0WPDGU851QKMJ7WZ/IMG_4028.JPG",
          desc:
              '"Cappuccino with tea" combines the creamy richness of a classic cappuccino with the aromatic infusion of tea, resulting in a delightful fusion beverage that tantalizes the taste buds. This unique concoction starts with a base of freshly brewed tea, known for its refreshing and invigorating qualities. Typically, a black tea or green tea serves as the foundation, providing a subtle yet distinct flavor profile.',
          price: "\$ 4.20",
        ),
        coffeeDetail(
            nameDetail: "with Cinnamon",
            image:
                "https://images.pexels.com/photos/19862765/pexels-photo-19862765/free-photo-of-chocolate-powder-on-cappuccino.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            desc: "",
            price: "")
      ],
    ),
    coffeeType(
      name: "Machiato",
      detail: [
        coffeeDetail(
          nameDetail: "with Creme Bulee",
          image:
              "https://cdn.shopify.com/s/files/1/0838/4525/files/the_types_of_macchiato_1024x1024.jpg?v=1651838996",
          desc:
              'A Macchiato with crème brûlée is a delightful fusion of two beloved treats, combining the bold, robust flavors of espresso with the creamy, caramelized sweetness of crème brûlée.',
          price: "\$ 3.50",
        ),
        coffeeDetail(
          nameDetail: "with Caramel",
          image:
              "https://131292952.cdn6.editmysite.com/uploads/1/3/1/2/131292952/s655736143881171309_p4_i2_w2048.jpeg",
          desc:
              'A caramel macchiato is a delicious espresso-based coffee drink that combines the rich, bold flavor of espresso with the creamy sweetness of steamed milk and a generous drizzle of caramel syrup.',
          price: "\$ 3.80",
        ),
        coffeeDetail(
          nameDetail: "with Ice",
          image:
              "https://www.tastingtable.com/img/gallery/iced-non-dairy-caramel-macchiato-recipe/intro-1682084902.jpg",
          desc: '',
          price: "",
        ),
        coffeeDetail(
          nameDetail: "with Cloud",
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPp6nmnjkFwwstfrmx5DLsEyBdIBiTwIJbAA&s",
          desc:
              'The Cloud Macchiato is a delightful and airy coffee beverage that combines the robust flavor of espresso with the creamy texture of milk froth, topped with a layer of fluffy foam reminiscent of a cloud.',
          price: "\$ 4.50",
        )
      ],
    ),
    coffeeType(
      name: "Latte",
      detail: [
        coffeeDetail(
          nameDetail: "",
          image: "",
          desc: '',
          price: "",
        ),
        coffeeDetail(
          nameDetail: "",
          image: "",
          desc: '',
          price: "",
        ),
        coffeeDetail(
          nameDetail: "",
          image: "",
          desc: '',
          price: "",
        ),
        coffeeDetail(
          nameDetail: "",
          image: "",
          desc: '',
          price: "",
        )
      ],
    ),
    coffeeType(
      name: "Americano",
      detail: [
        coffeeDetail(
          nameDetail: "",
          image: "",
          desc: '',
          price: "",
        ),
        coffeeDetail(
          nameDetail: "",
          image: "",
          desc: '',
          price: "",
        ),
        coffeeDetail(
          nameDetail: "with",
          image: "",
          desc: '',
          price: "",
        ),
        coffeeDetail(
          nameDetail: "with",
          image: "",
          desc: '',
          price: "",
        )
      ],
    )
  ];
}

class Coffee {
  String coffeeIMGPath;
  String coffeeName;
  String coffeeDes;
  String coffeePrice;
  String coffeeDesc;
  int qty;

  Coffee({
    this.coffeeIMGPath = "",
    this.coffeeName = "",
    this.coffeeDes = "",
    this.coffeePrice = "",
    this.coffeeDesc = "",
    this.qty = 1,
  });
}

class CoffeeProvider extends ChangeNotifier {
  List<Coffee> Coffeet = [
    Coffee(
      coffeeIMGPath: "assets/cappuoatmi.png",
      coffeeName: 'Cappuccino',
      coffeeDes: 'with Oat Milk',
      coffeePrice: '\$ 4.10',
      coffeeDesc:
          '"Cappuccino with oat milk" is a delightful twist on the classic cappuccino, offering a harmonious blend of rich espresso and creamy oat milk. This beverage starts with a foundation of finely brewed espresso, renowned for its bold and robust flavor profile. The addition of oat milk brings a velvety texture and a subtle sweetness that perfectly complements the espressos intensity',
    ),
    Coffee(
      coffeeIMGPath: "assets/cappucho.png",
      coffeeName: "Cappuccino",
      coffeeDes: "with Chocolate",
      coffeePrice: "\$ 4.20",
      coffeeDesc:
          '"Cappuccino with Chocolate" is a delightful fusion of two beloved flavors - the rich, robust taste of classic cappuccino combined with the indulgent sweetness of chocolate. This harmonious blend creates a unique and satisfying beverage that appeals to both coffee enthusiasts and chocolate lovers alike.',
    ),
    Coffee(
      coffeeIMGPath: "assets/tehkopi.png",
      coffeeName: "Cappuccino",
      coffeeDes: "with Tea",
      coffeePrice: "\$ 3.99",
      coffeeDesc:
          '"Cappuccino with tea" combines the creamy richness of a classic cappuccino with the aromatic infusion of tea, resulting in a delightful fusion beverage that tantalizes the taste buds. This unique concoction starts with a base of freshly brewed tea, known for its refreshing and invigorating qualities. Typically, a black tea or green tea serves as the foundation, providing a subtle yet distinct flavor profile.',
    ),
    Coffee(
      coffeeIMGPath: "assets/cappucho.png",
      coffeeName: "Cappuccino",
      coffeeDes: "with Chocolate",
      coffeePrice: "\$ 4.20",
      coffeeDesc:
          '"Cappuccino with Chocolate" is a delightful fusion of two beloved flavors - the rich, robust taste of classic cappuccino combined with the indulgent sweetness of chocolate. This harmonious blend creates a unique and satisfying beverage that appeals to both coffee enthusiasts and chocolate lovers alike.',
    ),
  ];

  List<Coffee> selectedItems = []; // Daftar item yang dipilih

  // Fungsi untuk menambah item ke dalam daftar yang dipilih
  void addItemToSelected(Coffee coffee) {
    var existingItemIndex =
        selectedItems.indexWhere((item) => item.coffeeDes == coffee.coffeeDes);

    if (existingItemIndex != -1) {
      // Jika item sudah ada, tambahkan qty-nya
      selectedItems[existingItemIndex].qty++;
    } else {
      // Jika item belum ada, tambahkan item baru dengan qty awal 1
      coffee.qty = 1;
      selectedItems.add(coffee);
    }

    notifyListeners(); // memberitahu widget untuk memperbarui tampilan
  }

  void reduceItemQty(Coffee coffee) {
    var existingItem =
        selectedItems.firstWhere((item) => item.coffeeDes == coffee.coffeeDes);

    if (existingItem != -1) {
      // Reduce qty if item is found
      if (existingItem.qty > 1) {
        existingItem.qty--;
      } else {
        // Remove item from the list if qty is 1
        selectedItems.remove(existingItem);
      }

      notifyListeners(); // Notify listeners after modifying the list
    }
  }

  // Metode untuk mendapatkan daftar item di keranjang
  List<Coffee> getSelectedItems() {
    return List.from(
        selectedItems); // Mengembalikan salinan dari list keranjang
  }
}
