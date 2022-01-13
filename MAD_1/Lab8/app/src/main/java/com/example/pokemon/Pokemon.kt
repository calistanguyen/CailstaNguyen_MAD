package com.example.pokemon

class Pokemon(var type: String = "", var region: String = "", var url: String = "") {
    fun setPokemonType(t: String) {
        type = t
    }

    fun setPokemonRegion(idx: Int){
        when(idx) {
            0 -> region = "Sinnoh"
            else -> region = "Hisui"
        }
    }

    fun setPokemonUrl(){
        if(type == "fire") {
            if(region == "Sinnoh") {
                url = "http://bulbapedia.bulbagarden.net/wiki/Chimchar_(Pokémon)"
            }else{
                url = "https://bulbapedia.bulbagarden.net/wiki/Cyndaquil_(Pok%C3%A9mon)"
            }
        }
        else if(type == "water") {
            if(region == "Sinnoh") {
                url = "https://bulbapedia.bulbagarden.net/wiki/Piplup_(Pok%C3%A9mon)"
            }else{
                url = "https://bulbapedia.bulbagarden.net/wiki/Oshawott_(Pok%C3%A9mon)"
            }
        }
        else if(type == "grass") {
            if(region == "Sinnoh") {
                url = "https://bulbapedia.bulbagarden.net/wiki/Turtwig_(Pok%C3%A9mon)"
            }else{
                url = "https://bulbapedia.bulbagarden.net/wiki/Rowlet_(Pok%C3%A9mon)"
            }
        }
    }

}