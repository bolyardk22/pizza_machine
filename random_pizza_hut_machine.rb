def welcome
	puts "Welcome to Random Pizza Hut! How many random pizzas would you like today?"
	x = gets.chomp.to_i
end

def size_func
	size_arr = ["personal pan","medium","large"].sample
end

def price_size (size)
	if size == "personal pan"
		sizeprice = 5.to_i
	elsif size == "medium"
		sizeprice = 8.to_i
	elsif size == "large"
		sizeprice = 10.to_i
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

def price_cheese(cheeses)
	if cheeses == "extra cheese"
		cheeseprice = 1
	else
		cheeseprice = 0
	end
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

def price_meat(meatprice)
	meatscountprice = (meatprice.count).to_i
	if meatscountprice <= 2
		finalmeatprice = 0
	else
		finalmeatprice = meatscountprice - 2
	end
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

def price_veggies (veggieprice)
	veggiecountprice = (veggieprice.count).to_i
	if veggiecountprice <= 2
		veggieprice = 0
	else
		veggiecountprice = veggiecountprice - 2
	end
end

total_cost = []

n = 1

welcome.times do
	sizeme = size_func
	cheeseme = cheese_func
	meatme = meat_func
	vegme = veggie_func
	total_price = (price_size (sizeme)).to_i + (price_cheese (cheeseme)).to_i + (price_meat (meatme)).to_i + (price_veggies (vegme)).to_i
	puts "Pizza number #{n} is a #{sizeme} pizza with #{crust_func} crust, #{sauce_func}, #{crust_flavor_func}, #{meatme.join}#{veggie_func.join}and #{cheeseme}.\n\nThis pizza costs $#{total_price}.\n\n"
	total_cost.push(total_price)
	n += 1
end

final_price = total_cost.inject(0, :+)

puts "Your total cost is $#{final_price}. Please enter the amount of cash you will be paying with today."

cash = gets.to_i

loop do
	if cash >= final_price
		puts "Your change is $#{cash - final_price}. Have a nice day, and thanks for choosing Random Pizza Hut!"
		break
	else
		puts "Insufficient funds. Your total cost is $#{final_price}. Please enter the amount of cash you will be paying with today."
		cash = gets.to_i
	end
end