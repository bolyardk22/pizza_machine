def welcome
	puts "Welcome to Pizza Hut! How many random pizzas would you like today?"
	x = gets.chomp.to_i
end

def size_func
	size = ["personal pan","medium","large"].sample
end

def price_size
	if size_func == "personal pan"
		sizeprice = 500.to_i
	elsif size_func == "medium"
		sizeprice = 800.to_i
	elsif size_func == "large"
		sizeprice = 1000.to_i
	else
		sizeprice = 10000.to_i
	end
end

def crust_func
	crust = ["pan","hand tossed","thin 'n crispy","original stuffed","skinny it up"].sample
end

def sauce_func
	sauce = ["classic marinara sauce","premium crushed tomato sauce","creamy garlic parmesan sauce","barbeque sauce","buffalo sauce","no sauce"].sample
end

def cheese_func
	cheese = ["no cheese","light cheese","regular cheese","extra cheese"].sample
end

def price_cheese
	cheeseprice = 5
#	if cheese_func == "extra cheese"
#		cheeseprice = 1
#	else
#		cheeseprice = 0
#	end
end

def crust_flavor_func
	crust_flavor = ["garlic buttery blend crust flavor","hut favorite crust flavor","toasted parmesan crust flavor","salted pretzel crust flavor","toasted cheddar crust flavor","no crust flavor"].sample
end

def meat_amount
	meatamount = rand(0..18)
end

def meat_func
	meats = []

	if meat_amount == 0
		meats.push "no meat, "

	else
		meat_amount.times do
			meats.push(many_meat = ["pepperoni, ","italian sausage, ","salami, ","meatball, ","ham, ","bacon, ","grilled chicken, ","beef, ","pork, "].sample)
	end
end
	meats.uniq
end

def price_meat
	meatprice = 2
#	if meats.count <= 2
#		meatprice = 0
#	else
#		meatprice = meats.count * 1
#	end
end



def veggie_amount
	veggieamount = rand(0..20)
end

def veggie_func
	veggies = []

	if veggie_amount == 0
		veggies.push "no veggies, "

	else
		veggie_amount.times do
			veggies.push(many_veggies = ["mushrooms, ","roasted spinach, ","peruvian cherry peppers, ","red onions, ","mediterranean black olives, ","green bell peppers, ","banana peppers, ","pineapple, ","jalapeno peppers, ","roma tomatoes, "].sample)
	end
end

	veggies.uniq
end

def price_veggies
	veggieprice = 1
#	if veggies.count <= 2
#		veggieprice = 0
#	else
#		veggieprice = veggies.count * 1
#	end
end

def price_func
	price_size + price_cheese + price_meat + price_veggies
end

n = 1

welcome.times do
	puts "Pizza number #{n} is a #{size_func} pizza with #{crust_func} crust, #{sauce_func}, #{crust_flavor_func}, #{meat_func.join}#{veggie_func.join}and #{cheese_func}.\n\n This pizza costs #{price_func}.\n\n"
	n += 1
end