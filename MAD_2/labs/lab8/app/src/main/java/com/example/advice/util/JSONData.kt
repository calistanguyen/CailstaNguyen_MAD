package com.example.advice.util

import android.content.Context
import android.util.Log
import com.android.volley.Request
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley
import com.example.advice.MainActivity
import org.json.JSONException
import org.json.JSONObject
import com.example.advice.model.Slip

class JSONData {
    fun loadJSON(context: Context, mainActivity: MainActivity){
        val rand_id = (1..10).random()
        val url = "https://api.adviceslip.com/advice/${rand_id}"
        // instantiate the Volley request queue
        val queue = Volley.newRequestQueue(context)
        // Request a string response from the provided URL.
        Log.e("Check", "hello im here")
        val request = StringRequest(
            Request.Method.GET, url,
            { response ->
                parseJSON(response, mainActivity)
            }, {
                Log.e("RESPONSE", error("request failed")) }
        )
        // Add the request to the RequestQueue
        queue.add(request)
    }


    fun parseJSON(response: String, mainActivity: MainActivity){
        try {
            val jsonObject = JSONObject(response).getJSONObject("slip")
            Log.e("OBJECT: ", jsonObject.toString())
            val slip = Slip(jsonObject.getInt("id"), jsonObject.getString("advice"))
            mainActivity.textView.text = slip.advice

        } catch (e: JSONException) {
            e.printStackTrace()
        }
    }
}