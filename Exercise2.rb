=begin
Exercise: Practice Map 
Use map to do the following
=end 

#Create an array that appends "Duck" to everybody in this array of first names

first_names = [ "Donald", "Daisy", "Daffy" ]

newArr= first_names.map {|name| p name + " Duck"}
newArr= first_names.map do |name|
     puts "#{name} Duck" 
     "#{name} Duck"
end 


#Create an array containing the squared values of every number in this array.
numbers = [ 1, 3, 9, 11, 100 ]
numbers.map {|num| p num ** 2}

#Create an array with the Celsius values for these Fahrenheit values.
fahrenheit_temps = [ -128.6, 0, 32, 140, 212 ]
fahrenheit_temps.map {|temp| p (temp - 32) * (5.0 / 9.0)}

#make the prevoiuse as a method 
def to_celsius(fahrenheit)
    (fahrenheit - 32) * (5.0 / 9.0)
end