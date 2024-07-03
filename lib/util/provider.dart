// import 'package:Trailblazer_Flutter/util/coffe_type.dart';
import 'package:flutter/material.dart';

class CoffeeDetail {
  String nameDetail;
  String image;
  String desc;
  String price;
  int qt;

  CoffeeDetail(
      {required this.nameDetail,
      required this.image,
      required this.desc,
      required this.price,
      this.qt = 1});
}

class coffeeType {
  String name;
  List<CoffeeDetail> detail;

  coffeeType({
    required this.name,
    required this.detail,
  });
}

class SelectedCoffeeDetail {
  String coffeeTypeName;
  CoffeeDetail detail;

  SelectedCoffeeDetail({
    required this.coffeeTypeName,
    required this.detail,
  });
}

class CoffeeNewProvider extends ChangeNotifier {
  List<coffeeType> coffee = [
    coffeeType(
      name: "Cappucino",
      detail: [
        CoffeeDetail(
          nameDetail: "with Chocolate",
          image:
              "https://ayomakan.oss-ap-southeast-5.aliyuncs.com/article/ARTICLE-AYOMAKAN_20231103140453.jpg",
          desc:
              '"Cappuccino with Chocolate" is a delightful fusion of two beloved flavors - the rich, robust taste of classic cappuccino combined with the indulgent sweetness of chocolate. This harmonious blend creates a unique and satisfying beverage that appeals to both coffee enthusiasts and chocolate lovers alike.',
          price: "\$ 4.10",
        ),
        CoffeeDetail(
          nameDetail: "with Oat Milk",
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTe5ymotTjjGDNDidHvPNmhlVgB2qwQmgJreQ&s",
          desc:
              '"Cappuccino with oat milk" is a delightful twist on the classic cappuccino, offering a harmonious blend of rich espresso and creamy oat milk. This beverage starts with a foundation of finely brewed espresso, renowned for its bold and robust flavor profile. The addition of oat milk brings a velvety texture and a subtle sweetness that perfectly complements the espressos intensity.',
          price: "\$ 3.99",
        ),
        CoffeeDetail(
          nameDetail: "with Tea",
          image:
              "https://images.squarespace-cdn.com/content/v1/57c3b7ecb3db2b6d36105e34/1530303651390-9M3O0WPDGU851QKMJ7WZ/IMG_4028.JPG",
          desc:
              '"Cappuccino with tea" combines the creamy richness of a classic cappuccino with the aromatic infusion of tea, resulting in a delightful fusion beverage that tantalizes the taste buds. This unique concoction starts with a base of freshly brewed tea, known for its refreshing and invigorating qualities. Typically, a black tea or green tea serves as the foundation, providing a subtle yet distinct flavor profile.',
          price: "\$ 4.20",
        ),
        CoffeeDetail(
            nameDetail: "with Cinnamon",
            image:
                "https://images.pexels.com/photos/19862765/pexels-photo-19862765/free-photo-of-chocolate-powder-on-cappuccino.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            desc:
                "A cappuccino with cinnamon is a delightful fusion of rich, aromatic espresso and steamed milk, topped with a light, frothy layer of milk foam. The warm, creamy base is perfectly complemented by a sprinkle of fragrant cinnamon, which adds a touch of spice and a comforting, cozy aroma.",
            price: "\$ 4.00")
      ],
    ),
    coffeeType(
      name: "Machiato",
      detail: [
        CoffeeDetail(
          nameDetail: "with Creme Bulee",
          image:
              "https://cdn.shopify.com/s/files/1/0838/4525/files/the_types_of_macchiato_1024x1024.jpg?v=1651838996",
          desc:
              'A Macchiato with crème brûlée is a delightful fusion of two beloved treats, combining the bold, robust flavors of espresso with the creamy, caramelized sweetness of crème brûlée.',
          price: "\$ 3.50",
        ),
        CoffeeDetail(
          nameDetail: "with Caramel",
          image:
              "https://131292952.cdn6.editmysite.com/uploads/1/3/1/2/131292952/s655736143881171309_p4_i2_w2048.jpeg",
          desc:
              'A caramel macchiato is a delicious espresso-based coffee drink that combines the rich, bold flavor of espresso with the creamy sweetness of steamed milk and a generous drizzle of caramel syrup.',
          price: "\$ 3.80",
        ),
        CoffeeDetail(
          nameDetail: "with Ice",
          image:
              "https://www.tastingtable.com/img/gallery/iced-non-dairy-caramel-macchiato-recipe/intro-1682084902.jpg",
          desc:
              'A macchiato with ice is a refreshing twist on the traditional espresso drink, perfect for hot days or when you crave a cool, invigorating treat. This beverage starts with a robust shot of espresso, its rich, bold flavors providing a strong base.',
          price: "\$ 3.99",
        ),
        CoffeeDetail(
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
        CoffeeDetail(
          nameDetail: "with Vanilla",
          image:
              "https://129746456.cdn6.editmysite.com/uploads/1/2/9/7/129746456/s937926895899696299_p56_i1_w2056.jpeg",
          desc:
              'A vanilla latte is a creamy and aromatic coffee beverage that combines the bold flavor of espresso with the smooth, sweet essence of vanilla. Steamed milk is added to create a rich and velvety texture, topped with a light froth.',
          price: "\$ 4.99",
        ),
        CoffeeDetail(
          nameDetail: "with Caramel",
          image:
              "https://125919230.cdn6.editmysite.com/uploads/1/2/5/9/125919230/s333043820543597362_p231_i1_w3264.jpeg?width=2560",
          desc:
              'A caramel latte is a delightful coffee beverage that combines the rich, robust flavor of espresso with the creamy, velvety texture of steamed milk. This indulgent drink is elevated by the addition of sweet, buttery caramel syrup, which infuses each sip with a luscious, caramelized taste.',
          price: "\$ 4.59",
        ),
        CoffeeDetail(
          nameDetail: "with Coconut",
          image:
              "https://media-cdn.tripadvisor.com/media/photo-s/16/ae/04/30/lavender-latte-2.jpg",
          desc:
              'A coconut latte is a delightful fusion of tropical flavors and rich coffee, offering a creamy and refreshing twist on the traditional latte. This beverage blends smooth, robust espresso with luscious coconut milk, creating a velvety texture and subtle sweetness that complements the coffees natural bitterness.',
          price: "\$ 3.80",
        ),
        CoffeeDetail(
          nameDetail: "with Almond",
          image:
              "https://i.pinimg.com/474x/83/0f/95/830f952ef5f7bcd9584165777f700922.jpg",
          desc:
              'An almond latte is a delicious and nutritious coffee beverage that combines the rich, bold flavor of espresso with the creamy, nutty taste of almond milk. This dairy-free alternative to traditional lattes offers a slightly sweet, smooth texture that perfectly complements the robust coffee.',
          price: "\$ 4.10",
        )
      ],
    ),
    coffeeType(
      name: "Americano",
      detail: [
        CoffeeDetail(
          nameDetail: "with Ice",
          image:
              "https://mocktail.net/wp-content/uploads/2022/03/homemade-Iced-Americano-recipe_1ig.jpg",
          desc:
              'An iced Americano is a refreshing and invigorating coffee beverage that offers a perfect blend of bold espresso and chilled water. This drink is crafted by pouring freshly brewed espresso shots over a glass of ice, then diluting it with cold water, creating a smooth and robust flavor that less intense than a straight espresso but still rich and satisfying.',
          price: "\$ 3.50",
        ),
        CoffeeDetail(
          nameDetail: "with Red Eye",
          image:
              "https://i0.wp.com/www.teacoffeecup.com/wp-content/uploads/2020/08/classic-americano-espresso.jpg?resize=400%2C400&ssl=1",
          desc:
              'A Red Eye Americano is a robust and highly caffeinated coffee beverage that combines the best of both worlds: a shot of espresso and a cup of drip coffee. This potent concoction starts with a rich, full-bodied espresso shot poured into a freshly brewed cup of drip coffee, resulting in an intense, bold flavor with a smooth finish.',
          price: "\$ 4.00",
        ),
        CoffeeDetail(
          nameDetail: "with Black Eye",
          image:
              "https://aboveaveragecoffee.com/wp-content/uploads/2021/05/What-Is-a-Red-Eye-Or-A-Black-Eye-Coffee.jpg",
          desc:
              'A Black Eye Americano is a powerful and robust coffee beverage that combines the intense flavors of both drip coffee and espresso. This potent drink starts with a base of rich, freshly brewed drip coffee, to which two shots of espresso are added, creating a deeply flavorful and highly caffeinated experience.',
          price: "\$ 3.80",
        ),
        CoffeeDetail(
          nameDetail: "with Cafe Crema",
          image:
              "https://cdn.coffeecircle.com/5da55357-2569-4ab2-9c24-c0d584e3f547/-/resize/1200x/-/quality/lighter/-/progressive/yes/-/format/auto/coffeecircleamericano3.jpg",
          desc:
              'A Black Café Crema Americano is a sophisticated coffee beverage that merges the robust intensity of an Americano with the smooth, creamy texture of a Café Crema. This drink starts with a long extraction of espresso, resulting in a rich and aromatic base with a velvety crema on top.',
          price: "\$ 3.90",
        )
      ],
    )
  ];

  List<SelectedCoffeeDetail> selectedItems = [];

  void addItemToSelected(coffeeType coffee, int index) {
    var existingItemIndex = selectedItems.indexWhere(
      (item) =>
          item.detail.nameDetail == coffee.detail[index].nameDetail &&
          item.coffeeTypeName == coffee.name,
    );

    if (existingItemIndex != -1) {
      selectedItems[existingItemIndex].detail.qt++;
    } else {
      var selectedDetail = coffee.detail[index];
      selectedItems.add(
        SelectedCoffeeDetail(
          coffeeTypeName: coffee.name,
          detail: CoffeeDetail(
            nameDetail: selectedDetail.nameDetail,
            image: selectedDetail.image,
            desc: selectedDetail.desc,
            price: selectedDetail.price,
            qt: 1,
          ),
        ),
      );
    }

    notifyListeners();
  }

  void reduceItemQty(SelectedCoffeeDetail coffee) {
    var existingItemIndex = selectedItems.indexWhere(
      (item) =>
          item.detail.nameDetail == coffee.detail.nameDetail &&
          item.coffeeTypeName == coffee.coffeeTypeName,
    );

    if (existingItemIndex != -1) {
      // Reduce qty if item is found
      if (selectedItems[existingItemIndex].detail.qt > 1) {
        selectedItems[existingItemIndex].detail.qt--;
      } else {
        // Remove item from the list if qty is 1
        selectedItems.removeAt(existingItemIndex);
      }

      notifyListeners(); // Notify listeners after modifying the list
    }
  }

  List<SelectedCoffeeDetail> getSelectedItems() {
    return List.from(selectedItems); // Return a copy of the selected items list
  }
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
