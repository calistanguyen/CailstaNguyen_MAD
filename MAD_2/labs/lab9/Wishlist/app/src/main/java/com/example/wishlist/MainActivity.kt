package com.example.wishlist

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.EditText
import android.widget.LinearLayout
import androidx.activity.viewModels
import androidx.appcompat.app.AlertDialog
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.wishlist.model.Item
import com.example.wishlist.model.ItemViewModel
import com.google.android.material.floatingactionbutton.FloatingActionButton
import com.google.android.material.snackbar.Snackbar

class MainActivity : AppCompatActivity() {
    private val viewModel: ItemViewModel by viewModels()
    private var itemAdapter: ItemAdapter? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        //get the recycler view
        val recyclerView: RecyclerView = findViewById(R.id.recyclerView)

        //divider line between rows
        recyclerView.addItemDecoration(DividerItemDecoration(this, LinearLayoutManager.VERTICAL))

        //set a layout manager on the recycler view
        recyclerView.layoutManager = LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false)

        //set up options
        val options = viewModel.options
        //create adapter using the options
        itemAdapter = ItemAdapter(options, viewModel)
        //set adapter on the recyclerview
        recyclerView.adapter = itemAdapter

        findViewById<FloatingActionButton>(R.id.fab).setOnClickListener { view ->
//create a vertical linear layout to hold edit texts
            val layout= LinearLayout(this)
            layout.orientation = LinearLayout.VERTICAL

            //create edit texts and add to layout
            val nameEditText = EditText(this)
            nameEditText.setHint(R.string.itemHint)
            layout.addView(nameEditText)
            val urlEditText = EditText(this)
            urlEditText.setHint(R.string.urlHint)
            layout.addView(urlEditText)

            // create alert dialog
            val dialog = AlertDialog.Builder(this)
            //set dialog title
            dialog.setTitle(R.string.addItem)
            //add layout to dialog
            dialog.setView(layout)

            //set OK action
            dialog.setPositiveButton(R.string.add) {dialog, which ->
                val name = nameEditText.text.toString()
                val url= urlEditText.text.toString()
                if (!name.isEmpty()){
                    val newItem = Item(name, url)
                    viewModel.addItem(newItem)
                    Snackbar.make(view, R.string.itemAdded, Snackbar.LENGTH_LONG)
                        .setAction(R.string.action, null).show()
                }
            }
            //sets cancel action
            dialog.setNegativeButton(R.string.cancel) { dialog, which ->
                //cancel
            }
            dialog.show()
        }
    }

    override fun onStart() {
        super.onStart()
        itemAdapter?.startListening()
    }

    override fun onStop() {
        super.onStop()
        itemAdapter?.stopListening()
    }
}
