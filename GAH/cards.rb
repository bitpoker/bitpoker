#!/usr/bin/env ruby

class Card
	attr_accessor :num, :suit
	attr_accessor :nums, :suits
	
	@@nums = [2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A]
	@@suits = [:D, :C, :H, :S]

	def initialize(num, suit)
		if nums.include?(num) && suits.include?(suit)
			@num = num
			@suit = suit
		end
	end

	def card_strength
		return (@nums.index(num) * 10) + (@suits.index(suit))
	end
end

class Deck
	attr_accessor :cards

	def initialize
		@cards = Array.new()
		#right now it is in order
		for num in Card.nums
			for suit in Card.suits
				@card = Card.new(num, suit)
				cards << card
			end
		end
	end

	def del_card(card)
		discard.push cards.delete(card)

	def del_first
		#discard first card from deck, for burning
		discard.push cards.delete_at 0
	end

	def del_last
		#discard last card from deck
		cards.delete_at -1
	end

	def shift_to_hand(numCards, hand)
		#moves cards from top of deck to hand
		hand.push cards.slice!(0, numCards)
	end

	def shift_to_field(numCards, field)
		#moves cards from top of deck to field
		field.push cards.slice!(0, numCards)
	end
end

class DiscardPile
	attr_accessor :discard
	def initialize
		@discard = Array.new()
	end

	def add_to_deck
		deck.push discard.slice!(0, discard.size-1)
	end
end

class Calculations
	attr_accessor :field, :hand, :combined
	attr_accessor :nums, :suits
	
	@@nums = [2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A]i
	@@suits = [:D, :C, :H, :S]

	def initialize(field, hand)
		@field = field
		@hand = hand
		@combined = field.concat hand
		sort_combined
	end

	def sort_combined
		@combined.sort! do |a, b|
			@nums.index(a.num) <=> @nums.index(b.num)
		end
		@combined.sort! do |a, b|
			@suits.index(a.suit) <=> @suits.index(b.suit)
		end
	end

	def card_numbers
		@combined_nums = combined.map { |x| x.num}
		nums.map do |x|
			combined_nums.count x
		end
	end

	def suit_numbers
		@combined_suit = combined.map { |x| x.suit }
		suits.map do |x|
			combined_suit.count x
		end
	end

	def straight_flush
		numbers = []
		combined.each {|x| numbers = x.card_strength - combined.index(x)}
		return numbers.length - numbers.uniq.length > 4
	end

	def full_house
		combined.combined_nums.count(3) > 0 && combined.combined_nums.count(2) > 0
	end

	def flush
		combined.suit_numbers > 4
	end

	def straight
		numbers = []
		combined.each {|x| numbers = nums.index(x.num) - combined.index(x)}
		return numbers.size - numbers.uniq.size > 4
	end

	def three_of_a_kind
		combined.combined_nums.count(3) > 0
	end

	def two_pair
		combined.combined_nums.count(2) > 1
	end

	def pair
		combined.combined_nums.count(2) > 0
	end
end

class Hand
	attr_accessor :hand
	def initialize
		@hand = []
	end

	def shift_to_field(card)
		field.push hand.slice!(card)
	end
end

class Field
	attr_accessor :field

	def initialize
		@field = []
	end

	def discard_field
		field.clear
	end
end

# methods, variables: snake_cased
# classes: camelCased
