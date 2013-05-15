class Card
	attr_accessor :num, :suit
	attr_accessor :nums, :suits

	def initialize num, suit
		@nums = [2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A]
		@suits = [:D, :C, :H, :S]

		@num = num
		@suit = suit
	end

	def card_strength
		return (@nums.index(num) * 10) + (@suits.index(suit))
	end
end

class Deck
	attr_accessor :cards

	def initialize
		@cards = Array.new()
		for num in Card.nums	
			for suit in Card.suit
				@card = Card.new(num, suit)	
				cards << card
			end
		end
	end

	def add_last_card card
		#add to end of the deck
		cards.push card
	end

	def add_first_card card
		#add to front of deck
		cards.unshift card
	end

	def del_card card
		#discard card from deck
		cards.delete card
	end

	def del_first
		#discard first card from deck
		cards.delete_at 0
	end

	def del_last
		#discard last card from deck
		cards.delete_at -1
	end

	def shift_to_field (numCards, Field)
		#moves cards from top of deck to field
		Field.field.push cards.slice(0, numCards)
	end
end

class Calculations
	attr_accessor :field, :hand, :combined
	attr_accessor :nums, :suits

	def initialize field, hand
		@nums = [2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A]
		@suits = [:D, :C, :H, :S]

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

card = [Card.new(:K, :S), Card.new(:Q, :S),
		Card.new(:J, :S), Card.new(10, :S),
		Card.new(9, :S)]
card1 = [Card.new(5, :S), Card.new(4, :S), Card.new(8,:S)]
# deck = Deck.new
calc = Calculations.new card, card1
puts calc.card_numbers
#calculations.card_numbers
#puts card[0].card_strength
# deck.add_first_card card
# deck.del_card card


# methods, variables: snake_cased
# classes: camelCased
