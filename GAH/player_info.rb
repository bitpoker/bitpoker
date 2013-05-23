#!/usr/bin/env ruby

require 'cards.rb'

class User
	attr_accessor :username
	attr_accessor :money
	attr_accessor :hand

	# Create the user object
	def initialize(username, money)
		@username = username
		@money = money	
		@hand = Hand.new
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
