class Car

	@@total_car_count = 0 #class variable
	@@cars_per_color = Hash.new { |color, count| count = 0}

	def self.most_popular_color
		# popular_color = @@cars_per_color.max_by { |color, count| count}
		# popular_color[0]
		@@cars_per_color.each { |color, count| return color if count == @@cars_per_color.values.max }
	end

	def self.total_car_count #getter for class variable
		@@total_car_count
	end

	def self.cars_per_color
		@@cars_per_color
	end

	attr_accessor :color, :fuel, :distance, :roof_status

	def to_s()
		"I'm a car! I've driven #{@distance} and have #{@fuel} gallons gas left"
	end

	def initialize(color)
		@fuel = 10
		@distance = 0
		@color = color
		@@total_car_count += 1
		@@cars_per_color[color] += 1
	end

	def change_color(new_color)
		@@cars_per_color[@color] -= 1
		@color = new_color
		@@cars_per_color[new_color] += 1

	end

	def drive(miles)
		if (@fuel - miles/20.0) >= 0
			@distance += miles
			@fuel -= miles/20.0
		else
			@distance += @fuel * 20.0
			@fuel = 0
			puts "You're out of gas!"
		end
	end

	def fuel_up()
		gallons_needed = 10.0 - @fuel
		puts "You must pay $#{3.5 * gallons_needed}"
		@fuel = 10.0
	end
end

class ConvertibleCar < Car

  attr_accessor :roof_status

  def initialize(color='pink', convertible='true')
    super(color)
    @convertible = convertible
    @roof_status = 'closed'
  end

  def top_down
    @roof_status = 'open'
  end

  def close_top
    @roof_status = 'closed'
  end
end

# car_a = Car.new()
# car_b = Car.new()
# puts car_a
# puts car_b
# car_a.drive(10)
# puts car_a
# puts car_b
# car_a.drive(232)
# car_b.drive(117)
# puts car_a
# puts car_b

puts Car.total_car_count
c1 = Car.new("blue")
puts Car.total_car_count
c2 = Car.new("blue")
puts Car.total_car_count
puts c1.color
puts Car.cars_per_color
c1.change_color("red")
puts c1.color
puts Car.cars_per_color
c3 = Car.new("blue")
puts Car.cars_per_color
c4 = ConvertibleCar.new("red", true)
p Car.most_popular_color
puts c4.roof_status
