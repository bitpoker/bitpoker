#!/usr/bin/env ruby

{ :J => 11, :Q => 11, :K => 12, :A => 13 }
NUMS = [ 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A ]

{ :D => 0, :C => 14, :H => 28, :S => 42 }
SUITS = [ :D, :C, :H, :S ]

class Card
	attr_accessor :num, :suit

	# Create the card object
	def initialize(num, suit)
		if NUMS.include?(num) and SUITS.include?(suit)
			@num = num
			@suit = suit
		end
	end

	def card_strength
		return @suit + @num;
	end
end

class Deck
	attr_accessor :cards

	# Create the deck object
	def initialize
		@cards = Array.new()
		#right now it is in order
		for suit in SUITS
			for num in NUMS
				@card = Card.new(num, suit)
				cards << card
			end
		end
	end

	# Delete a card
	def del_card(card)
		discard.push cards.delete(card)
	end

	# Discard first card from deck, for burning
	def del_first
		discard.push cards.delete_at 0
	end

	# Discard last card from deck
	def del_last
		cards.delete_at -1
	end

	# Moves cards from top of deck to hand
	def shift_to_hand(numCards, hand)
		hand.push cards.slice!(0, numCards)
	end

	# Moves cards from top of deck to field
	def shift_to_field(numCards, field)
		field.push cards.slice!(0, numCards)
	end
end

class DiscardPile
	attr_accessor :discard

	# Create the discard pile object
	def initialize
		@discard = Array.new()
	end

	def add_to_deck
		deck.push discard.slice!(0, discard.size-1)
	end
end

class Calculations
	# modify this so it only considers the 5 cards used from hand and field
	attr_accessor :field, :hand, :combined

	# Create an object for calculations
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
			a.suit <=> b.suit
		end
	end

	def card_numbers
		@combined_nums = combined.map { |x| x.num}
		NUMS.map do |x|
			combined_nums.count x
		end
	end

	def suit_numbers
		@combined_suit = combined.map { |x| x.suit }
		SUITS.map do |x|
			combined_suit.count x
		end
	end

	def combined_strength

	end

	def royal_flush
		return straight_flush and combined.at(0) == 10
	end

	def straight_flush
		numbers = []
		combined.each {|x| numbers = x.card_strength - combined.index(x)}
		return numbers.length - numbers.uniq.length > 4
	end

	def full_house
		return combined.combined_nums.count(3) > 0 and combined.combined_nums.count(2) > 0
	end

	def flush
		return combined.suit_numbers > 4
	end

	def straight
		numbers = []
		combined.each {|x| numbers = x.num - combined.index(x)}
		return numbers.size - numbers.uniq.size > 4
	end

	def three_of_a_kind
		return combined.combined_nums.count(3) > 0
	end

	def two_pair
		return combined.combined_nums.count(2) > 1
	end

	def pair
		return combined.combined_nums.count(2) > 0
	end
end

class Hand
	attr_accessor :hand

	# Create the hand object
	def initialize
		@hand = []
	end
end

class Field
	attr_accessor :field

	# Create the field object
	def initialize
		@field = []
	end

	# Clear the field
	def discard_field
		field.clear
	end
end

# methods, variables: snake_cased
# classes: camelCased
