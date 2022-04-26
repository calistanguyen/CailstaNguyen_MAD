package com.example.wishlist.model

data class Item(val item_name: String, val url:String) {
    constructor(): this("", ""){}
}
