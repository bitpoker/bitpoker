#!/usr/bin/env ruby

class User
	attr_accessor :username
	attr_accessor :money

	# Create the user object
	def initialize(username, money)
		@username = username
		@money = money	
	end

	# Return the player's username
	def get_name
		return @username
	end

	# Return the amount of money a player has
	def get_money
		return @money
	end
end	
