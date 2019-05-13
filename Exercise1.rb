### Exercise: Practice Map (15 minutes)
=begin
Use `each` to do the following...

- Say hello to everybody in the below array of names (sample output: `Hello Donald!`).
  names = [ "Donald", "Daisy", "Huey", "Duey", "Luey" ]

=end
names = [ "Donald", "Daisy", "Huey", "Duey", "Luey" ]

# using each 
arrHello = names.each {|hello| p "Hello " + hello}

# using while loop 
counter = 0 
while counter < names.length 
    p "Hello "+ names[counter]
    counter += 1
end 

=begin
Print out the squared values of every number in this numbers array.
  numbers = [ 1, 3, 9, 11, 100 ]

=end
numbers = [ 1, 3, 9, 11, 100 ]

# using each 
sqr = numbers.each {|num| p num ** 2}

# using while loop 
counter = 0 
while counter < numbers.length 
    p numbers[counter]**
    counter += 1
end 


=begin
Print out the Celsius values for an array containing Fahrenheit values.
  > Hint: `C = (F - 32) * (5 / 9)`
=end
fahrenheit_temps = [ -128.6, 0, 32, 140, 212 ]
fahrenheit_temps.each do |degree| 
    # we use float here also we can use  2.to_f
    p (degree - 32) * (5.0 / 9.0) 
end 


=begin
Insert all the values in the artists array into the ninja_turtles array.
=end
artists = [ "Leonardo", "Donatello", "Raphael", "Michelangelo" ]
ninja_turtles = []

ninja_turtles = artists.each {|ninja_turtles| p ninja_turtles}

=begin
Bonus: Print out every possible combination of the below ice cream flavors and toppings.
=end
flavors = [ "vanilla", "chocolate", "strawberry", "butter pecan", "cookies and cream", "rainbow" ]
toppings = [ "gummi bears", "hot fudge", "butterscotch", "rainbow sprinkles", "chocolate sprinkles" ]

ice=[]
# give us array of arrays 
flavors.product(toppings)
#combine betweein them 
ice = flavors.product(toppings).map(&:join)

#another solution 
newArr = []
flavors.each do |flav|
    toppings.each do | top|
        newArr.push (flav + " "+top)
    end 
end 
puts newArr
