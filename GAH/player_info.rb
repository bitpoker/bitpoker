#!/usr/bin/env ruby

require 'cards.rb'

class User
	attr_accessor :username
	attr_accessor :money
	attr_accessor :hand

	def initialize(username, money)
		@username = username
		@money = money	
		@hand = Hand.new
	end

	def get_name
		return @username
	end
	
	def get_money
		return @money
	end
end	
