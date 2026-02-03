abstract class Drink {
  String getDescription();

  double getCost();
}

class Coffee implements Drink {
  @override
  String getDescription() => 'Coffee';

  @override
  double getCost() => 2.0;
}

class Tea implements Drink {
  @override
  String getDescription() => 'Tea';

  @override
  double getCost() => 1.5;
}

abstract class Addons {
  String getDescription();

  double getCost();
}

class Milk implements Addons {
  @override
  String getDescription() => 'Coffee with Milk';

  @override
  double getCost() => 0.5;
}

class Sugar implements Addons {
  @override
  String getDescription() => 'Coffee with Sugar';

  @override
  double getCost() => 0.3;
}

class DrinkOrder {
  final Drink drink;
  final List<Addons> addons = [];

  DrinkOrder(this.drink);

  void addAddons(Addons addon) {
    addons.add(addon);
  }

  double getCost() {
    double totalCost = drink.getCost();
    for (var addon in addons) {
      totalCost += addon.getCost();
    }
    return totalCost;
  }
}

void main() {
  final drinkOrder = DrinkOrder(Coffee());
  drinkOrder.addAddons(Milk());
  drinkOrder.addAddons(Sugar());
  print('\$${drinkOrder.getCost()}');
}
