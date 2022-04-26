package com.example.wishlist.model

import androidx.lifecycle.ViewModel
import com.example.wishlist.util.ItemDatabase

class ItemViewModel: ViewModel() {
    private val itemdb = ItemDatabase()
    val options = itemdb.getOptions()

    fun addItem(item: Item){
        itemdb.addItem(item)
    }

    fun deleteItem(id: String){
        itemdb.deleteItem(id)
    }
}
