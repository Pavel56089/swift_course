/*:
## Exercise - Return Values

 Write a function called `greeting` that takes a `String` argument called name, and returns a `String` that greets the name that was passed into the function. I.e. if you pass in "Dan" the return value might be "Hi, Dan! How are you?" Use the function and print the result.
 */
func greeting(name: String) -> String {
    return "Hi, \(name)! How are you?"
}

// Example usage:
let name = "Ivan"
let greetingMessage = greeting(name: name)
print(greetingMessage)


//:  Write a function that takes two `Int` arguments, and returns an `Int`. The function should multiply the two arguments, add 2, then return the result. Use the function and print the result.
func multiplyAndAdd(_ number1: Int, _ number2: Int) -> Int {
    let result = (number1 * number2) + 2
    return result
}

// Example usage:
let num1 = 5
let num2 = 3
let result = multiplyAndAdd(num1, num2)
print(result)

/*:
[Previous](@previous)  |  page 5 of 6  |  [Next: App Exercise - Separating Functions](@next)
 */
