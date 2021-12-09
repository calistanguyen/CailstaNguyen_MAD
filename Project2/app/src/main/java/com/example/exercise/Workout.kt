package com.example.exercise

class Workout(var name: String, var reps: Int, var sets: Int, var weight: Double, var unit: String = "lbs"){
    fun setWeightUnit(toUnit: String){
        if(toUnit != unit){
            if(toUnit == "kgs"){
                weight /= 2.205
                unit = "kgs"
            }else{
                weight *= 2.205
                unit = "lbs"
            }
        }
    }
}