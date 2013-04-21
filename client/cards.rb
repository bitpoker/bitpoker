CARD_NUMS = [2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A]
CARD_SUITS = [:D, :C, :H, :S]

class Suit
	
end

class Card
	attr_accessor :num, :suit

	def initialize(num, suit)
		self.num = num
		self.suit = suit
	end
end