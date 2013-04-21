class Card
	attr_accessor :num, :suit
	attr_accessor :nums, :suits
	@nums = [2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A]
	@suits = [:D, :C, :H, :S]

	def initialize num, suit
		@num = num
		@suit = suit
	end

	def cardStrength
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
		cards.delete_at(0)
	end
	def del_last
		cards.delete_at(-1)
	end
end

# card = Card.new :K, :S
# deck = Deck.new
# deck.add_first_card card
# deck.del_card card

# methods, variables: snake_cased
# classes: camelCased