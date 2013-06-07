class Card
	RANKS = { 2 => 0, 3 => 1, 4 => 2, 5 => 3, 6 => 4, 7 => 5, 8 => 6, 9 => 7, 10 => 8, :jack => 9, :queen => 10, :king => 11, :ace => 12 }
	SUITS = { :diamonds => 0, :clubs => 13, :hearts => 26, :spades => 39 }

	attr_accessor :rank, :suit

    # 	I'm assuming that this one is no longer needed ~William
# 	def initialize(rank, suit)
# 		if RANKS.include?(rank) and SUITS.include?(suit)
# 			@rank = rank
# 			@suit = suit
# 		end
# 	end

	# Create the card object
	def initialize(id)
		if id >= 0 and id < 52
			@rank = RANKS.key(id % 13)
			@suit = SUITS.key(id - id % 13)
        else
            puts "Card value is out of range"
		end
	end

	def id
        puts @rank, @suit
		return SUITS[@suit] + RANKS[@rank];
	end
end

class Deck < Array
	# Create the deck object
	def initialize
		# Initialize cards in order
		super( (0..51).map { |id| Card.new(id) })
	end

	# Get a card
	def get(card)
		return delete(card)
	end

	# Draw a card
	def draw
		return shift
	end

	# Draw n cards
	def draw(n)
		return shift(n)
	end
end

class PokerCalculations
	attr_accessor :cards

	# Create an object for calculations
	def initialize(cards)
		@cards = cards;
		sort_combined

		ranks = @cards.map { |x| x.rank}
		@rank_freqs = ranks.inject(Hash.new(0)) { |h,v| h[v] += 1; h }

		suits = @cards.map { |x| x.suit }
		@suit_freqs = suits.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
	end

	def sort_combined
		@cards.sort! do |a, b|
			a.id <=> b.id
		end
	end

	def highest_hand
		if(straight)
			hasStraight = true
			if(flush)
				hasFlush = true
				if(straight_flush)
					if(royal_flush)
						return "royal flush"
					end
					return "straight flush"
				end
			end
		end
		if(four_of_a_kind)
			return "four of a kind"
		end
		if(three_of_a_kind)
			hasThreeKind = true
			if(pair)
				hasPair = true
				return "full house"
			end
		end
		if(hasFlush || flush)
			return "flush"
		end
		if(hasStraight)
			return "straight"
		end
		if(hasThreeKind)
			return "three of a kind"
		end
		if(hasPair || pair)
			if(two_pair)
				return "two pair"
			end
			return "pair"
		end
		return "high card"
	end

	def straight_flush
		return (straight and flush)
	end

	def royal_flush
		return (straight_flush and @cards.at(0) == 10)
	end

	def four_of_a_kind
		return @rank_counts.count(4) > 0
	end

	def full_house
		return (three_of_a_kind and pair)
	end

	def flush
		return @suit_freqs.count(5) > 0;
	end

	def straight
		numbers = []
		@cards.each {|x| numbers = x.rank - @cards.index(x)}
		return numbers.size - numbers.uniq.size > 4
	end

	def three_of_a_kind
		return @rank_counts.count(3) > 0
	end

	def two_pair
		return @rank_counts.count(2) > 1
	end

	def pair
		return @rank_counts.count(2) > 0
	end
end

# methods, variables: snake_cased
# classes: CamelCased
