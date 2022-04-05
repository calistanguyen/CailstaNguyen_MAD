package com.example.coffeedrinks

class SampleData {
    val coffeeDrinklist = ArrayList<CoffeeDrink>()
    init {
        coffeeDrinklist.add(CoffeeDrink("Drip Coffee", "Coffee made by letting boiling water drip slowly through finely ground coffee", R.drawable.drip_coffee))
        coffeeDrinklist.add(CoffeeDrink("Flat White", "Espresso with less microfoam than a latte", R.drawable.flat_white))
        coffeeDrinklist.add(CoffeeDrink("Latte", "Coffee made with espresso and steamed milk", R.drawable.latte))
        coffeeDrinklist.add(CoffeeDrink("Macchiato", "Coffee drink made with espresso with a small amount of foamed milk", R.drawable.machiatto))
    }

}