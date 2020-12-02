import Cocoa
    
print ("1")

var a = 4

func even (num: Int)  {
    if (num % 2) == 0 {
        print ("число делится на 2")
    }else {
        print ("число не делится на 2 без остатка")
    }
}
print (even (num: a))
    
print ("2")

func comp3 (num: Int) {
    switch num % 3 == 0 {
    case true:
        print ("число делится на 3")
    default:
        print("не делится")
    }
}
print (comp3(num: a))
   
print ("3")

var array: [Int] = []
for i in 0...100 {
    array.append(i)
}
print (array)
    
print ("4")

for num in array {
    if (num % 2) == 0 || (num % 3) == 0 {
        array.remove (at: array.firstIndex (of: num)!)
    }
}
print (array)

print ("5")

func fibb ( _ n: Int) -> Int {
    if n == 0 {
        return 0
        }
    else if n == 1 {
        return 1
        }
    return fibb (n-1) + fibb(n-2)
}
for i in 1 ... 20{
    array.append (fibb (i))
}
print (array)

print ("6")

var k = 2
var num: [Int] = []

for _ in 2...1000{
    num.append(k)
    k += 1
}

var j = 2
for _ in 2...1000 {
    for value in num {
        if (value > j) && ((value % j) == 0) {
            num.remove(at: num.firstIndex(of: value)!)
        }
    }
    j += 1
}
num.removeLast(num.count - 100)
print (num)



    



    



