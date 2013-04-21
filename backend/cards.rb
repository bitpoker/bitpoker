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

	def initialize(cards)
		@cards = cards || []
	end

	def add_last_card card
		cards.shift card
	end

	def add_first_card card
		cards.unshift card
	end

	def del_card card
		cards.delete card
	end

	def del_first
		cards.delete_at 0
	end

	def del_last
		cards.delete_at -1
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
		@nums.each {|x| combined.grep(x).size}
	end

	def suit_numbers
		@suits.each {|x| combined.grep(x).size}
	end
end

class Player
	attr_accessor :hand
	def initialize
		@hand = []
	end
end

class Field
	attr_accessor :field

	def initialize
		@field = []
	end

	def add_to_field card
		field.shift card
	end

end
card = [Card.new(:K, :S), Card.new(:Q, :S),
		Card.new(:J, :S), Card.new(10, :S),
		Card.new(9, :S)]
card1 = [Card.new(5, :S), Card.new(4, :S), Card.new(8,:S)]
# deck = Deck.new
calculations = Calculations.new card, card1
puts calculations.sort_combined
#calculations.card_numbers
#puts card[0].card_strength
# deck.add_first_card card
# deck.del_card card


# methods, variables: snake_cased
# classes: camelCased