def welcome
	puts "Thank you for ordering from Random Pizza Hut! How many random pizzas would you like today?"
	x = gets.to_i
end

def deliv_or_pick_chomp
	puts "Random Pizza Hut delivers within 15 miles of the restaurant. Is this order for delivery or pick up? Please enter 'd' for delivery, or 'pu' for pick up."
	answer = gets.chomp

	until answer == "d" || answer == "pu"
		puts "I'm sorry, I didn't understand that. Please enter 'd' for delivery or 'pu' for pick up."
		answer = gets.chomp
	end

	if answer == "d"
		deliverrr = "delivered"

	elsif answer == "pu"
		deliverrr = "picked_up"

	else
		deliverrr = "please just work already"
	end
end



def deliv_or_pick_func(deliverorpick)
	if deliverorpick == "delivered"
		puts "Please enter the number of miles between your address and the restaurant.\n\n"
		miles = gets.to_f

		if miles <= 5
			delivery_cost = 2
		elsif miles <= 10
			delivery_cost = 4
		elsif miles <= 15
			delivery_cost = 6
		else
			puts "Sorry, we don't deliver that far. Your order will be ready for pick up in 20 minutes.\n\n"
			delivery_cost = 0
		end

	else
		puts "Your order will be ready for pick up in around 20 minutes.\n\n"
		delivery_cost = 0
	end

end

def size_func
	size_arr = ["personal pan","medium","large"].sample
end

def price_size (size)
	if size == "personal pan"
		sizeprice = 5.to_f
	elsif size == "medium"
		sizeprice = 8.to_f
	else 
		sizeprice = 10.to_f
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
	meatscountprice = (meatprice.count).to_f
	if meatscountprice <= 2
		finalmeatprice = 0
	else
		finalmeatprice = (meatscountprice * 0.5) - 1
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
	veggiecountprice = (veggieprice.count).to_f
	if veggiecountprice <= 2
		veggieprice = 0
	else
		veggiecountprice = (veggiecountprice * 0.5) - 1
	end
end

total_cost = []

n = 1

welcome.times do
	sizeme = size_func
	cheeseme = cheese_func
	meatme = meat_func
	vegme = veggie_func
	total_price = (price_size (sizeme)).to_f + (price_cheese (cheeseme)).to_f + (price_meat (meatme)).to_f + (price_veggies (vegme)).to_f
	puts "Pizza number #{n} is a #{sizeme} pizza with #{crust_func} crust, #{sauce_func}, #{crust_flavor_func}, #{meatme.join}#{veggie_func.join}and #{cheeseme}.\n\nThis pizza costs $#{'%.2f' %(total_price)}.\n\n"
	total_cost.push(total_price)
	n += 1
end

subtotal = total_cost.inject(0, :+)

puts "Your subtotal is $#{'%.2f' %(subtotal)}.\n\n"

puts "Please enter the tip percentage you would like to provide."
	tip_perc = gets.chomp.to_f
	tip = (tip_perc / 100) * subtotal

puts "Your tip is $#{'%.2f' %(tip)}\n\n"

deliveryprice = "#{'%.2f' %(deliv_or_pick_func(deliv_or_pick_chomp))}"

puts "Your delivery fee is $#{'%.2f' %(deliveryprice)}.\n\n"

tax = subtotal * 0.06

puts "Your tax is $#{'%.2f' %(tax)}\n\n"

final_price = subtotal.to_f + tip.to_f + deliveryprice.to_f + tax.to_f

puts "Your final price is $#{'%.2f' %(final_price.to_f)}. Please enter the amount of cash you will be paying with today."

cash = gets.to_f

loop do
	if cash >= final_price
		puts "Your change is $#{'%.2f' %(cash - final_price)}. Have a nice day, and thanks for choosing Random Pizza Hut!"
		break
	else
		puts "Insufficient funds. Your total cost is $#{'%.2f' %(final_price)}. Please enter the amount of cash you will be paying with today."
		cash = gets.to_f
	end
end