import UIKit


func print_day(day: Int) {
    print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
    print("********************************")
    print("************ Day \(day) *************")
    print("********************************")

}
//https://www.hackingwithswift.com/100/swiftui

//Day 4
//This time the challenge is to
    //1. create an array of strings,
    //2. then write some code that prints the number of items in the array
    //3. and also the number of unique items in the array
let a = ["s1", "s2", "s3", "s3", "s1"]

print(a.count)

print(Set(a))



enum switch_test {
    case a,b,c,d
}

let sst = switch_test.c

switch sst {
case switch_test.a:
    print("A")
case switch_test.b:
    print("B")
case switch_test.c:
    print("C")
    fallthrough
case switch_test.d:
    print("D")
}

//checkpoint 3
/*
 The problem is called fizz buzz, and has been used in job interviews, university entrance tests, and more for as long as I can remember. Your goal is to loop from 1 through 100, and for each number:

 If it’s a multiple of 3, print “Fizz”
 If it’s a multiple of 5, print “Buzz”
 If it’s a multiple of 3 and 5, print “FizzBuzz”
 Otherwise, just print the number.
 */


for i in 1...100 {
    var s = ""
    
    if i.isMultiple(of: 3) {
        s = "Fizz"
    }
    
    if i.isMultiple(of: 5) {
        s += "Buzz"
    }
    
    if s.isEmpty {
        s = String(i)
    }
    print(s)
}


/*
 ****************************************************************
 ======================= Day 7 ==================================
 ****************************************************************
 */
//how to write functions
print_day(day: 7)

func doNothing() {
    print("func without params")
}
doNothing()

func add_two_number(a: Int, b: Int) -> Int {
    let ret = a + b
    print("a + b = \(a) + \(b) = \(ret)")
    return ret
}
add_two_number(a: 3, b: 4)

func sum_and_mean(_ array: [Int]) -> (mean: Double, sum: Int) {
    var sum : Int = 0
    var mean : Double = 0.0
    for elem in array {
        sum += elem
    }
    mean = Double(sum)/Double(array.count)
    return (mean: mean, sum: sum)
}
let (mean, sum) = sum_and_mean([1,3,5])
print("mean \(mean) and sum \(sum)")
var sum_and_mean_ret = sum_and_mean([3,5,10,2])
print("mean \(sum_and_mean_ret.mean) and sum \(sum_and_mean_ret.sum)")

func shift_num(_ number: Int, for times: Int) -> Int {
    number<<times
}
print("1 shifted for 3 times is equal to \(shift_num(1, for: 3))")





/*
 ****************************************************************
 ======================= Day 8 ==================================
 ****************************************************************
 */
//default values and error handlings
print_day(day: 8)


func sum_array(array: [Int], end: Int = 0) -> Int {
    var ret = 0
    if end == 0 {
        ret = array.reduce(0, {x , y in x + y})
    } else {
        assert(end >= 0 && end < array.count)
        ret = array[0...end].reduce(0, {x , y in x + y})
    }
    return ret
}

let array_day8 = [1, 3, 5, 11]
print("sum array [1, 3, 5, 11] = \(sum_array(array: array_day8))")
print("sum array [1, 3, 5, 11] till 5 = \(sum_array(array: array_day8, end: 2))")

//let's rewrite the before function with error handling
enum SumError: Error {
    case Negative, OutOfRange
}
func to_sum_array(array: [Int], end: Int = 0) throws -> Int {
    var ret = 0
    if end == 0 {
        ret = array.reduce(0, {x , y in x + y})
    } else {
        if end < 0 {
            throw SumError.Negative
        } else if end >= array.count {
            throw SumError.OutOfRange
        } else {
            ret = array[0...end].reduce(0, {x , y in x + y})
        }
    }
    return ret
}

do {
    try to_sum_array(array: array_day8)
    try to_sum_array(array: array_day8, end: -1)

} catch SumError.Negative {
    print("Negative range")
} catch SumError.OutOfRange {
    print("Out of range error")
} catch {
    print("None of previous error have been catched")
}


