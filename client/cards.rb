CARD_NUMS = [2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A]
CARD_SUITS = [:D, :C, :H, :S]

class Card
	attr_accessor :num, :suit

	def initialize(num, suit)
		@num = num
		@suit = suit
	end

	def cardStrength()
		return (CARD_NUMS.index(num) * 10) + (CARD_SUITS.index(suit))
	end
end

card = Card.new :K, :S

puts card.cardStrength()