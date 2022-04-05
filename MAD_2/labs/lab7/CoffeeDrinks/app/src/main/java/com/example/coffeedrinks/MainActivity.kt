package com.example.coffeedrinks

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import androidx.navigation.NavController
import androidx.navigation.findNavController
import androidx.navigation.ui.onNavDestinationSelected
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.coffeedrinks.model.CoffeeDrink
import com.example.coffeedrinks.sample.SampleData
import com.example.tulips.DrinkAdapter

class MainActivity : AppCompatActivity() {

    private var drinkList = SampleData.coffeeDrinklist
    private lateinit var navController: NavController
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        //get the recycler view
        val recyclerView: RecyclerView = findViewById(R.id.recyclerView)
        //divider line between rows
        recyclerView.addItemDecoration(DividerItemDecoration(this, LinearLayoutManager.VERTICAL))

        //define an adapter
        val adapter = DrinkAdapter(drinkList) { item: CoffeeDrink -> itemClicked(item) }

        //assign the adapter to the recycle view
        recyclerView.adapter = adapter

        //set a layout manager on the recycler view
        recyclerView.layoutManager = LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false)

//        navController = findNavController(androidx.navigation.ui.R.id.nav_host_fragment_content_main)

    }

    private fun itemClicked(item : CoffeeDrink) {
        //create intent
        val intent = Intent(this, DetailActivity::class.java)
        intent.putExtra("name", item.name)
        intent.putExtra("description", item.description)
        intent.putExtra("resourceID", item.imageResourceID)
        //start activity
        startActivity(intent)
    }

    override fun onCreateOptionsMenu(menu: Menu): Boolean {
        // Inflate the menu; this adds items to the action bar if it is present.
        menuInflater.inflate(R.menu.main, menu)
        return true
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        // val navController = findNavController(R.id.nav_host_fragment_content_main)
       when (item.itemId) {
           R.id.nav_settings -> {
               startActivity(Intent(this, AboutActivity::class.java))
               return true
           }
       }
        return false
    }
}