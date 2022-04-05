package com.example.tulips

import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.coffeedrinks.R
import com.example.tulips.DrinkAdapter.ViewHolder
import com.example.coffeedrinks.model.CoffeeDrink

class DrinkAdapter(private val bulbList: ArrayList<CoffeeDrink>, private val clickListener:(CoffeeDrink) -> Unit): RecyclerView.Adapter<ViewHolder>() {
    class ViewHolder(view: View): RecyclerView.ViewHolder(view) {
        val drinkTextView: TextView = view.findViewById(R.id.textView)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        //create an instance of LayoutInflater
        val layoutInflater = LayoutInflater.from(parent.context)
        //inflate the view
        val itemViewHolder = layoutInflater.inflate(R.layout.list_item, parent, false)
        return ViewHolder(itemViewHolder)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        //get data at the position
        val drink = bulbList[position]

        holder.drinkTextView.text = drink.name
        //assign click listener
        holder.itemView.setOnClickListener{clickListener(drink)}
    }

    override fun getItemCount() = bulbList.size

}