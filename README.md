[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# Ruby Loops and Methods

## Lesson Objectives

- Identify specific differences between Ruby and Javascript in the following areas...
  - Blocks and loops
  - Methods (Functions)
- Advanced Ruby argument discussion

## Blocks

Any code surrounded by curly braces is a block.

```ruby
2.times {
  print "Hey!"
}
```

With blocks, you can group a set of instructions together so that they can be passed around your program.

The curly braces can also be traded for the words do and end, which is nice if your block is longer than one line.

```ruby
loop do
  print "Hey!"
end
```

## Loops

One of the most common things we do as developers is to iterate through data structures.

Whenever we talk about data in Ruby, its important to review how Ruby handles groups of data.

We learned how to iterate over collections in Javascript using loops. Now we're going to learn the same in Ruby.

### Review JS Loops

<details>
<summary>What loops did we use in Javascript?</summary>
<code>while</code>, <code>do...while</code>, <code>for</code>, <code>for...in</code>, <code>.forEach</code>
</details>

### Looping with Ruby

In JS if we wanted to print numbers 0 through 3 we would:

```javascript
for(var i = 0; i < 3; i++) {
  console.log(i);
}
// > 0
// > 1
// > 2
```

In Ruby this is much cleaner:

```ruby
3.times { |i| puts i }
# > 0
# > 1
# > 2
```

`times` is a method that takes a _block_.  A block is just a chunk of code that may or may not take arguments.  The closest thing to a block in ES6-land would be an (anonymous) arrow function.

We also have `.upto` and `.downto` methods for looping.

> Yes there _are_ `for` loops in Ruby but we DO NOT use them

But, the closest equivalent to Javascript's `for` loop is Rubys `for...in` loop

```rb
users = ["Alice", "Bob", "Carol"]
for user in users do
  puts user
end
```

We can also iterate over arrays:

```ruby
arr = [10, 20, 30]

arr.each { |num| puts num }
# > 10
# > 20
# > 30

arr.map { |num| num / 10 }
# => [1, 2, 3]
```

`each` and `map` also take blocks (just like `forEach` and `map` take callbacks in JS).

For blocks with longer lines or multiple lines, replace `{` and `}` with `do` and `end`

```ruby
arr.map do |num|
  "#{num / 10} is great!"
end
# => ["1 is great!", "2 is great!", "3 is great!"]
```

And we can iterate over hashes:

```ruby
hash = { a: 1, b: 2, c: 3 }
hash.each do |key, val|
  puts "the value of #{key} is #{val}"
end
# > the value of a is 1
# > the value of b is 2
# > the value of c is 3
```

### Exercise: Other types of Loops in Ruby (30 minutes)

#### [while](https://ruby-doc.org/core-2.6.1/doc/syntax/control_expressions_rdoc.html#label-while+Loop)

```rb
input = ""
puts "You must guess the Magic Words to exit the while loop!"
while input != "Magic Words" do
  puts "What are the Magic Words?"
  input = gets.chomp
end
puts "You made it out! Congrats!"
```

#### [until](https://ruby-doc.org/core-2.6.1/doc/syntax/control_expressions_rdoc.html#label-until+Loop)


```rb
input = ""
puts "You must guess the Magic Words to exit the while loop!"
until input == "Magic Words" do
  puts "What are the Magic Words?"
  input = gets.chomp
end
puts "You made it out! Congrats!"
```

#### [loop](https://ruby-doc.org/core-2.6.1/Kernel.html#method-i-loop)

```rb
puts "You must guess the Magic Words to exit the while loop!"
loop do
  puts "What are the Magic Words?"
  input = gets.chomp
  break if input == "Magic Words"
end
puts "You made it out! Congrats!"
```

#### [.times](https://ruby-doc.org/core-2.6.1/Integer.html#method-i-times)

```rb
users = ["Alice", "Bob", "Carol"]
users.length.times do |index|
  puts users[index]  
end
```
> [**Further Reading on Ruby loops**](http://www.tutorialspoint.com/ruby/ruby_loops.htm)


### Exercise: Practice Each (15 minutes)

Use `each` to do the following...

- Say hello to everybody in the below array of names (sample output: `Hello Donald!`).

  ```ruby
  names = [ "Donald", "Daisy", "Huey", "Duey", "Luey" ]
  ```

- Print out the squared values of every number in this numbers array.

  ```ruby
  numbers = [ 1, 3, 9, 11, 100 ]
  ```

- Print out the Celsius values for an array containing Fahrenheit values.

  > Hint: `C = (F - 32) * (5 / 9)`

  ```ruby
  fahrenheit_temps = [ -128.6, 0, 32, 140, 212 ]
  ```

- Insert all the values in the `artists` array into the `ninja_turtles` array.

  ```ruby
  artists = [ "Leonardo", "Donatello", "Raphael", "Michelangelo" ]
  ninja_turtles = []
  ```

- **Bonus:** Print out every possible combination of the below ice cream flavors and toppings.

  ```ruby
  flavors = [ "vanilla", "chocolate", "strawberry", "butter pecan", "cookies and cream", "rainbow" ]
  toppings = [ "gummi bears", "hot fudge", "butterscotch", "rainbow sprinkles", "chocolate sprinkles" ]
  ```
<details>
  <summary>
    Hint
  </summary>
  Use nested enumerable methods or check out <a href="http://apidock.com/ruby/Array/product">product</a>.
</details>

### Map (30 minutes)

#### Explore 1

Run these two snippets separately:

```rb
cart = ["shoes", "watch", "computer"]
uppercase = cart.each do |product|
  caps_product = product.upcase
  puts caps_product
  caps_product
end
puts uppercase.join(", ")
```

```rb
cart = ["shoes", "watch", "computer"]
uppercase = cart.map do |product|
  caps_product = product.upcase
  puts caps_product
  caps_product
end
puts uppercase.join(", ")
```

<details>
<summary>How would you explain the difference in the result?</summary>
<ul>
  <li><code>.each</code> executes the code block for each item in the original array and returns the original array regardless of what the block returns.</li>
  <li><code>.map</code> returns a new array with the changes in the block applied to each element.</li>
</ul>
</details>

#### Explore 2

Consider:

```ruby
cart = ["shoes", "watch", "computer"]
uppercase = []
cart.each{|product| uppercase.push(product.upcase) }
puts uppercase.join(", ")
```

```rb
cart = ["shoes", "watch", "computer"]
uppercase = cart.map{|product| product.upcase }
puts uppercase.join(", ")
```

<details>
<summary>What is the difference in the result of these two snippets?</summary>
Nothing: they have the same result. They are two ways of doing the same thing.
</details>

#### Explore 3: Bang

Consider:

```rb
cart = ["shoes", "watch", "computer"]
uppercase = cart.map{|product| product.upcase }
puts cart
puts uppercase
```

Below is the same snippet, but with `.map!` instead of `.map`.

<details>
<summary>What does <code>!</code> often indicate in Ruby?</summary>
That this method is "dangerous", usually because it will modify, or <strong>mutate</strong> the object upon which it was called.
</details>

```rb
cart = ["shoes", "watch", "computer"]
uppercase = cart.map!{|product| product.upcase }
puts cart
puts uppercase
```

<details>
<summary>What's the difference between <code>.map</code> and <code>.map!</code>?</summary>
<code>.map</code> leaves the original array alone, whereas <code>.map!</code> changes it.
</details>

### Exercise: Practice Map (15 minutes)

Use `map` to do the following...  

1. Create an array that appends "Duck" to everybody in this array of first names

  ```ruby
  first_names = [ "Donald", "Daisy", "Daffy" ]

  #= ["Donald Duck", "Daisy Duck", "Daffy Duck"]
  ```

2. Create an array containing the squared values of every number in this array.

  ```ruby
  numbers = [ 1, 3, 9, 11, 100 ]

  # => [1, 9, 81, 121, 10000]
  ```

3. Create an array with the Celsius values for these Fahrenheit values.

  > Hint: `C = (F - 32) * (5 / 9)`

  ```ruby
  fahrenheit_temps = [ -128.6, 0, 32, 140, 212 ]

  #=> [-89.2, -17.8, 0, 60, 100]
  ```


## Methods

As stated before, everything in Ruby is an object so there is no distinction in this language between functions and methods. Under the hood, even seemingly stand-alone functions are in fact associated with an object. The convention, however, is to call these methods.

**We use the word `method` in Ruby, never `function`. If we do it's mostly out of habit.**

A method is made up of a few components. Take a look at the following method.
```ruby
def double( number )
   doubled_number = number * 2
   return doubled_number
end  

double( 3 )
# => 6

double 3
# => 6
```

This method has several components to point out: 
 - def - the Ruby equivalent of function
 - double - the method name in the below example
 - number - the argument name in the below example
 - end - closes the method

Passing arguments in Ruby works fairly similar to how it does in JS. They get passed as comma separated values after the method name.

```ruby
def hello(name, greeting, small_talk, punctuation)
  "#{greeting} #{name}, #{small_talk}#{punctuation}"
end
```

Lets think back to the behaviors of arguments in JS.  Remember how lenient it is?

In Ruby, if you specify a number of arguments, the function must take that number of arguments. No more, No less. 

### Less
```ruby
$ hello("Jamie", "Hark", "frickin' cold eh")

=> ArgumentError: wrong number of arguments (given 3, expected 4)
```

### More
```ruby
$ hello("Jamie", "Hark", "frickin' cold eh", ".", "Forsooth, ye yonder pilgrim is quite the bespoke son of a tailors daughter, ai?")

=> ArgumentError: wrong number of arguments (given 5, expected 4)
```

SIDENOTE: Ruby's errors are amazing. Use them!

There are some fun ways to play with arguments and define further behavior:

### Default arguments

```ruby
def drink_milk(thirsty = true)
  return "I'm not thirsty" unless thirsty

  "mmmmmm... milk...."
end
```

### Woah, that return statement?

In Ruby, returns are implicit by design. Ruby will always assume that the last line of the method will be returned. So why the first return?

Can you read it in English? One of Ruby's biggest benefitsis that it reads pretty closely to English

Additionally, you can add the statements `if` and `unless` to your return statement, which acts similarly to an if block.

```javascript
function apiCall(err, data){
  if (err){
    return err;
  } 
  //Do stuff
}
```

vs.

```ruby
def api_call(err, data)
  return err if err
  #Do Stuff
end
```

### Everything is an Expression

```ruby
def add(a, b)
  a + b
end

add(1, 2) # => 3

add(1, 2, 3)
# > ArgumentError: wrong number of arguments (given 3, expected 2)
```

Notice we do not need the keyword ```return```. The last line hit by the method will always be the return value. This is called an implicit return.

### Predicate Methods (?)

This is similar to adding the bang to the end of a method. Predicate methods using `?` returns a boolean value.
```ruby
  5.odd?
  # true
  5.even?
  # false
  something = "A thing"
  # => "A thing"
  something.nil?
  # => false
```

## Ruby Code Style Guide

The Ruby community is very opinionated about styling.  As you are starting out, you MUST follow [these rules](https://github.com/bbatsov/ruby-style-guide).

Here are the most important rules

**Blocks**

* A single line block must use `{` and `}`
* A multi-line must use `do` and `end`
* If an argument is unused it should start with `_` (or just be named `_`)
  * `hash.each { |_key, val| puts val }`

**Methods**

* A method should end with a `?` if an only if it always returns a boolean
  * These are called _predicate methods_
* A method ending in `!` should be a _dangerous_ version of the method sans `!`
  * _dangerous_ means either that it can mutate the object _or_ that can raise an error
* Don't name methods like `get_foo`, `set_foo`. They should be `foo` and `foo=`
* **Do** use `attr_reader` and `attr_writer`
* Do not use parens when calling a method without args
  * `super` is one possible exception
* **Do** use parens for every method except for DSLs (and a small list of other common methods)
  * `attr_reader`, `puts`, `require`, `include`, `it`, `has_many`, ...
