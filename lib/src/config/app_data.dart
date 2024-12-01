import 'package:green_io/src/model/cart_item.dart';
import 'package:green_io/src/model/item.dart';
import 'package:green_io/src/model/order.dart';
import 'package:green_io/src/model/user.dart';

Item apple = Item(
  id: 1,
  name: 'Apple',
  imgUrl: 'assets/fruits/apple.png',
  unit: 'kg',
  price: 5.5,
  description: 'Premium apples, all organic.',
);

Item avocado = Item(
  id: 2,
  name: 'Avocado',
  description: 'For all my friends I wish you a very pleasant day lmao',
  imgUrl: 'assets/fruits/avocado.png',
  unit: 'kg',
  price: 17.5,
);
Item banana = Item(
  id: 3,
  name: 'Banana',
  description: 'For all my friends I wish you a very pleasant day lmao',
  imgUrl: 'assets/fruits/banana.png',
  unit: 'kg',
  price: 7.33,
);
Item blueberry = Item(
  id: 4,
  name: 'Blueberry',
  description: 'For all my friends I wish you a very pleasant day lmao',
  imgUrl: 'assets/fruits/blueberry.png',
  unit: 'kg',
  price: 12.77,
);
Item cherry = Item(
  id: 5,
  name: 'Cherry',
  description: 'For all my friends I wish you a very pleasant day lmao',
  imgUrl: 'assets/fruits/cherry.png',
  unit: 'un',
  price: 39.90,
);
Item durianFruit = Item(
  id: 6,
  name: 'Durian Fruit',
  description: 'For all my friends I wish you a very pleasant day lmao',
  imgUrl: 'assets/fruits/durian_fruit.png',
  unit: 'un',
  price: 412.48,
);
Item grape = Item(
  id: 7,
  name: 'Grape',
  description: 'For all my friends I wish you a very pleasant day lmao',
  imgUrl: 'assets/fruits/grape.png',
  unit: 'kg',
  price: 13.75,
);
Item guava = Item(
  id: 8,
  name: 'Guava',
  description: 'For all my friends I wish you a very pleasant day lmao',
  imgUrl: 'assets/fruits/guava.png',
  unit: 'kg',
  price: 16.18,
);
Item kiwi = Item(
  id: 9,
  name: 'Kiwi',
  description: 'For all my friends I wish you a very pleasant day lmao',
  imgUrl: 'assets/fruits/kiwi.png',
  unit: 'kg',
  price: 31.89,
);
Item lemon = Item(
  id: 10,
  name: 'Lemon',
  description: 'For all my friends I wish you a very pleasant day lmao',
  imgUrl: 'assets/fruits/lemon.png',
  unit: 'kg',
  price: 10.99,
);
Item lime = Item(
  id: 11,
  name: 'Lime',
  description: 'For all my friends I wish you a very pleasant day lmao',
  imgUrl: 'assets/fruits/lime.png',
  unit: 'kg',
  price: 2.5,
);
Item lychee = Item(
  id: 12,
  name: 'Lychee',
  description: 'For all my friends I wish you a very pleasant day lmao',
  imgUrl: 'assets/fruits/lychee.png',
  unit: 'kg',
  price: 25.69,
);
Item mango = Item(
  id: 13,
  name: 'Mango',
  description: 'For all my friends I wish you a very pleasant day lmao',
  imgUrl: 'assets/fruits/mango.png',
  unit: 'kg',
  price: 6.8,
);
Item mangosteen = Item(
  id: 14,
  name: 'Mangosteen',
  description: 'For all my friends I wish you a very pleasant day lmao',
  imgUrl: 'assets/fruits/mangosteen.png',
  unit: 'un',
  price: 8.95,
);
Item melon = Item(
  id: 15,
  name: 'Melon',
  description: 'For all my friends I wish you a very pleasant day lmao',
  imgUrl: 'assets/fruits/melon.png',
  unit: 'un',
  price: 12,
);
Item orange = Item(
  id: 16,
  name: 'Orange',
  description: 'For all my friends I wish you a very pleasant day lmao',
  imgUrl: 'assets/fruits/orange.png',
  unit: 'kg',
  price: 4.75,
);
Item papaya = Item(
  id: 17,
  name: 'Papaya',
  description: 'For all my friends I wish you a very pleasant day lmao',
  imgUrl: 'assets/fruits/papaya.png',
  unit: 'un',
  price: 19.98,
);
Item peach = Item(
  id: 18,
  name: 'Peach',
  description: 'For all my friends I wish you a very pleasant day lmao',
  imgUrl: 'assets/fruits/peach.png',
  unit: 'kg',
  price: 18.99,
);
Item pear = Item(
  id: 19,
  name: 'Pear',
  description: 'For all my friends I wish you a very pleasant day lmao',
  imgUrl: 'assets/fruits/pear.png',
  unit: 'kg',
  price: 32.99,
);
Item pineapple = Item(
  id: 20,
  name: 'Pineapple',
  description: 'For all my friends I wish you a very pleasant day lmao',
  imgUrl: 'assets/fruits/pineapple.png',
  unit: 'un',
  price: 6.4,
);
Item pitaya = Item(
  id: 21,
  name: 'Pitaya',
  description: 'For all my friends I wish you a very pleasant day lmao',
  imgUrl: 'assets/fruits/pitaya.png',
  unit: 'kg',
  price: 20.5,
);
Item salak = Item(
  id: 22,
  name: 'Salak',
  description: 'For all my friends I wish you a very pleasant day lmao',
  imgUrl: 'assets/fruits/salak.png',
  unit: 'un',
  price: 14.86,
);
Item starFruit = Item(
  id: 23,
  name: 'Star Fruit',
  description: 'For all my friends I wish you a very pleasant day lmao',
  imgUrl: 'assets/fruits/star_fruit.png',
  unit: 'kg',
  price: 12.98,
);
Item straberry = Item(
  id: 24,
  name: 'Straberry',
  description: 'For all my friends I wish you a very pleasant day lmao',
  imgUrl: 'assets/fruits/strawberry.png',
  unit: 'kg',
  price: 23,
);
Item watermelon = Item(
  id: 25,
  name: 'Watermelon',
  description: 'For all my friends I wish you a very pleasant day lmao',
  imgUrl: 'assets/fruits/watermelon.png',
  unit: 'kg',
  price: 2.8,
);

class AppData {
  static final List<Item> items = [
    apple,
    avocado,
    banana,
    blueberry,
    cherry,
    durianFruit,
    grape,
    guava,
    kiwi,
    lemon,
    lime,
    lychee,
    mango,
    mangosteen,
    melon,
    orange,
    papaya,
    peach,
    pear,
    pineapple,
    pitaya,
    salak,
    starFruit,
    straberry,
    watermelon,
  ];

  static final List<String> categories = [
    'All',
    'Fruits',
    'Vegetables',
    'Meat',
    'Cereals',
    'Dairy',
  ];

  static final List<CartItem> cartItems = [
    CartItem(item: orange, quantity: 2),
    CartItem(item: mango, quantity: 3),
    CartItem(item: starFruit, quantity: 5),
    CartItem(item: lemon, quantity: 4),
  ];

  static final User user = User(
    id: 1,
    email: 'vini@gmail.com',
    password: '',
    cpf: '050.269.290-10',
    name: 'vini',
    phone: '(51) 9 9515-6466',
  );

  static final List<Order> orders = [
    Order(
      id: 1,
      createdDateTime: DateTime.parse('2025-11-25 23:03:00.000'),
      overdueDateTime: DateTime.parse('2025-11-26 00:03:00.110'),
      items: [
        CartItem(
          item: mango,
          quantity: 5,
        ),
        CartItem(
          item: watermelon,
          quantity: 3,
        ),
      ],
      stats: 'preparing_purchase',
      copyAndPaste: 'asdjh412312jsda',
      total: (mango.price * 5) + (watermelon.price * 3),
    ),
    Order(
      id: 2,
      createdDateTime: DateTime.parse('2025-11-27 20:33:00.000'),
      overdueDateTime: DateTime.parse('2025-11-26 21:33:00.110'),
      items: [
        CartItem(
          item: watermelon,
          quantity: 5,
        ),
      ],
      stats: 'delivered',
      copyAndPaste: 'asdjh412312jsda',
      total: watermelon.price * 4,
    ),
  ];
}
