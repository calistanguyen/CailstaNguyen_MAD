package com.example.wishlist

import android.content.Intent
import android.net.Uri
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.wishlist.model.Item
import com.example.wishlist.model.ItemViewModel
import com.firebase.ui.firestore.FirestoreRecyclerAdapter
import com.firebase.ui.firestore.FirestoreRecyclerOptions
import com.google.android.material.snackbar.Snackbar
import com.google.firebase.firestore.ktx.toObject

class ItemAdapter(options: FirestoreRecyclerOptions<Item>, private val viewModel: ItemViewModel) : FirestoreRecyclerAdapter<Item, ItemAdapter.ViewHolder>(options)  {

    class ViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        var nameTextView: TextView = view.findViewById(R.id.textView)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ItemAdapter.ViewHolder {
        val layoutInflater = LayoutInflater.from(parent.context)
        val itemViewHolder = layoutInflater.inflate(R.layout.list_item, parent, false)
        return ViewHolder(itemViewHolder)
    }

    override fun onBindViewHolder(holder: ItemAdapter.ViewHolder, position: Int, model: Item) {
        holder.nameTextView.text = model.item_name
        holder.itemView.setOnCreateContextMenuListener(){menu, view, menuInfo ->
            menu.setHeaderTitle(R.string.delete)

            menu.add(R.string.yes).setOnMenuItemClickListener {
                val id = snapshots.getSnapshot(position).id
                viewModel.deleteItem(id)
                Snackbar.make(view, R.string.deleteItem, Snackbar.LENGTH_LONG)
                    .setAction(R.string.action, null).show()
                true
            }
            menu.add(R.string.no)
        }

        //onclick listener
        holder.itemView.setOnClickListener{view->
            val documentSnapshot = snapshots.getSnapshot(position)
            val url = documentSnapshot.toObject<Item>()?.url

            var intent = Intent()
            intent.action = Intent.ACTION_VIEW
            intent.data = Uri.parse(url)

            view.context.startActivity(intent)
        }

    }
}