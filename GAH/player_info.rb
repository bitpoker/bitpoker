require 'cards.rb'

class User_Info
	attr_accessor :username
	attr_accessor :money

	def initialize(username, money)
		@username = username
		@money = money	
	end

	def getName
		return @username
	end
	
	def getMoney
		return @money
	end
end	

class Player < User_Info
	attr_accessor :hand
	
	@hand = Hand.new
end
