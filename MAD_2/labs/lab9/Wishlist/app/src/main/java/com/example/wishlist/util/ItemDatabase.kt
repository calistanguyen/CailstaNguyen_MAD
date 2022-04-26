package com.example.wishlist.util

import com.example.wishlist.model.Item
import com.firebase.ui.firestore.FirestoreRecyclerOptions
import com.google.firebase.firestore.FirebaseFirestore

class ItemDatabase {
    //Firestore instance
    private val db = FirebaseFirestore.getInstance()

    //recipe collection
    private val itemRef = db.collection("wishlist")

    //FirestoreRecycler options for the adapter
    fun getOptions(): FirestoreRecyclerOptions<Item> {
        //define query
        val query = itemRef
        val options = FirestoreRecyclerOptions.Builder<Item>()
            .setQuery(query, Item::class.java)
            .build()
        return options
    }

    fun addItem(item: Item){
        itemRef.add(item)
    }

    fun deleteItem(id: String){
        itemRef.document(id).delete()
    }
}
