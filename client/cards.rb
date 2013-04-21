class Card
	attr_accessor :num, :suit
	attr_accessor :nums, :suits
	@nums = [2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A]
	@suits = [:D, :C, :H, :S]

	def initialize num, suit
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
		@cards = []
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
	@nums = [2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A]
	@suits = [:D, :C, :H, :S]

	def initialize field, hand
		@field = field
		@hand = hand
		@combined = hand.concat field
		@card_numbers = []
		@suit_nums = []
		for i in nums
			card_numbers.shift combined.grep(i.num).size
		end
		for i in suits
			suit_nums.shift combined.grep(i.suit).size
		end
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
# card = Card.new :K, :S
# deck = Deck.new
# calulations = Calculations.new [0, 0], [0, 0, 0]
# deck.add_first_card card
# deck.del_card card


# methods, variables: snake_cased
# classes: camelCased