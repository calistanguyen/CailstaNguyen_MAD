var score: Int?
print("score is \(score)")
score = 80
print("score is \(score!)")

//if let checks if score is equal to nil

if let currentScore = score {
    print("My current score is \(currentScore)")
}


//coalescing operator similar to ternary but for optionals
score = 2
let myScore = score ?? 0
print("my score is \(myScore)")


//implicitly unwrapped
let newScore: Int! = 95;


//Type Casting

class Pet {
    var name: String
    init(name: String) {
        self.name = name
    }
    func hi(){
        print("Hello im \(name)")
    }
}

class Dog : Pet {
    var breed: String
    init(name: String, breed: String ) {
        self.breed = breed;
        //super.init bc using init from super class
        super.init(name:name)
    }
    
}

class Fish : Pet {
    var species: String
    init(name: String, species: String) {
        self.species = species
        super.init(name: name)
    }
    override func hi(){
        print("I am a fish")
    }
}


//type Pet array [Pet]
let myPets = [
    Dog(name: "Odie", breed: "Australian Shepherd"),
    Dog(name: "Boba", breed: "Bernedoodle"),
    Fish(name: "Nemo", species: "Clown Fish")
]
var dogCount = 0
var fishCount = 0

for pet in myPets {
    if pet is Dog {
        dogCount += 1
    } else if pet is Fish {
        fishCount += 1
    }
}

print("Dogs: \(dogCount) \nFish: \(fishCount)")

//type casting to treat it as an instance of what class the object is
for pet in myPets {
    if let dog = pet as? Dog {
        print("\(dog.name) is a \(dog.breed)")
    } else if let fish = pet as? Fish {
        print("\(fish.name) is a \(fish.species)")
        fish.hi()
    }
}

//as! is force unwrap and type cast, will generate error if it's the wrong class type


//closures

let names = ["Calista", "George", "Josiah", "Abby", "Kenzie"]

//using a function
func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}

var reversed = names.sorted(by: backwards);
print(reversed)

//using a closure
var ordered = names.sorted(by: {(s1: String, s2:String)->Bool in return s1<s2})
print(ordered)
//other closure versions
ordered = names.sorted(by: {s1, s2 in return s1<s2})
ordered = names.sorted(by: {s1, s2 in s1<s2})


//enums

enum carType {
    case gas
    case electric
    case hybrid
}

var car = carType.electric
print(car)
car = .hybrid
print(car)

enum MathError: Error {
    case DivideByZero
    case LOL
}

func divide(num1: Double, num2: Double) throws -> Double {
    guard num2 > 0 else {
        throw MathError.LOL
    }
    return num1/num2
}

do {
    try print(divide(num1: 10, num2: 0))
} catch MathError.DivideByZero {
    print("u cant divide by 0")
} catch MathError.LOL {
    print  ("LOL UR DUMB");
    
}
