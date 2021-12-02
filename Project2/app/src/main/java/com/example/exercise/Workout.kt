package com.example.exercise

class Workout(var name: String, var reps: Int, var sets: Int, var weight: Double, var unit: String = "lbs"){
    fun setWeightUnit(toUnit: String){
        if(toUnit != unit){
            if(toUnit == "kg"){
                weight /= 2.205
                unit = "kg"
            }else{
                weight += 2.205
                unit = "lb"
            }
        }
    }
}