{ :J => 11, :Q => 11, :K => 12, :A => 13 }
NUMS = [ 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A ]

{ :D => 0, :C => 14, :H => 28, :S => 42 }
SUITS = [ :D, :C, :H, :S ]

class Card
	attr_accessor :num, :suit

	def initialize num, suit
		@num = num
		@suit = suit
	end

	def card_strength
		return @suit + @num;
	end
end

class Deck
	attr_accessor :cards

	def initialize
		@cards = Array.new()
		for suit in SUITS
			for num in NUMS
				@card = Card.new(num, suit)
				cards << card
			end
		end
	end

	def add_last_card card
		#add to end of the deck
		@cards.push card
	end

	def add_first_card card
		#add to front of deck
		@cards.unshift card
	end

	def del_card card
		#discard card from deck
		@cards.delete card
	end

	def del_first
		#discard first card from deck
		@cards.delete_at 0
	end

	def del_last
		#discard last card from deck
		@cards.delete_at -1
	end

	def shift_to_field (numCards, field)
		#moves cards from top of deck to field
		field.push @cards.slice(0, numCards)
	end
end

class Calculations
	attr_accessor :field, :hand, :combined

	def initialize field, hand
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
		combined.each {|x| numbers = x.num - combined.index(x)}
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
	def add_card card
		cards.push card
	end
	def rm_card card
		cards.delete card
	end
end

class Field
	attr_accessor :field

	def initialize
		@field = []
	end
end

# methods, variables: snake_cased
# classes: camelCased
