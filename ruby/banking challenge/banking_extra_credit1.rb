class Person

	attr_accessor :name
	attr_accessor :cash

	def initialize(name, cash)
		@name = name
		@cash = cash
		puts "Hi, #{@name}. You have $#{@cash}!"
	end

end

class Bank

	
	attr_reader :bank_name

	def accounts
		@accounts
	end

	def initialize (bank_name)
		@accounts = {}
		@bank_name = bank_name
		puts "#{@bank_name} was just created."
	end


	def open_account(person)
		@accounts[person.name] = 0
		puts "#{person.name}, thanks for opening an account at #{@bank_name}!"
	end

	def withdraw(person, amount)
		if amount <= @accounts[person.name]
			@accounts[person.name] -= amount
			person.cash += amount
			puts "#{person.name} withdrew $#{amount} to #{@bank_name}. #{person.name} has #{person.cash}. #{person.name} account has $#{@accounts[person.name]}."
		else
			puts "#{person.name} does not have enough money in the account to withdraw $#{amount}."
		end
	end

	def deposit(person, amount)
		if amount <= person.cash
			@accounts[person.name] += amount
			person.cash -= amount
			puts "#{person.name} deposited $#{amount} to #{@bank_name}. #{person.name} has #{person.cash}. #{person.name} account has $#{@accounts[person.name]}."
		else
			puts "#{person.name} does not have enough cash to deposit $#{amount}."
		end
	end

	def transfer(person, bank, amount)
		if amount <= @accounts[person.name]
	 		@accounts[person.name] -= amount
	 		bank.accounts[person.name] +=  amount
	 		puts "#{person.name} transferred #{amount} from the #{@bank_name} acount to the #{bank.bank_name} account. The #{@bank_name} account has $#{@accounts[person.name]} and the #{bank.bank_name} account has $#{bank.accounts[person.name]}."
		else
			puts "#{person.name} does not have enough money in the account to transfer $#{amount}."
		end
	end
end


# chase = Bank.new("JP Morgan Chase")
# wells_fargo = Bank.new("Wells Fargo")
# me = Person.new("Shehzan", 500)
# friend1 = Person.new("John", 1000)
# chase.open_account(me)
# chase.open_account(friend1)
# wells_fargo.open_account(me)
# wells_fargo.open_account(friend1)
# chase.deposit(me, 200)
# chase.deposit(friend1, 300)
# chase.withdraw(me, 50)
# chase.transfer(me, wells_fargo, 100)
# chase.deposit(me, 5000)
# chase.withdraw(me, 5000)
# puts chase.total_cash_in_bank
# puts wells_fargo.total_cash_in_bank
# chase.transfer(me, wells_fargo, 500)
