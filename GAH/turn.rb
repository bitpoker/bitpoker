require 'player_info.rb'
require 'cards.rb'

class Game
	attr_accessor :players
	attr_accessor :numPlayers
	attr_accessor :bet
	
	@@players = Array.new()

	def initialize(players)
		@players = players
		@numPlayers = players.size
	end

	def addPlayer(player)
		if numPlayers < 7
			players << player
			numPlayers += 1
	end
end

class Round < Game
	attr_accessor :roundPlayers
	attr_accessor :bet
	attr_accessor :field
	attr_accessor :deck
	
	def initialize(Game game)
		@@roundPlayers = Game.other_array
		@@Number bet = NULL
	end

	def raise(value)
		if Player.getMoney <= value && bet <= Player.getMoney
			bet = value
				return @value
		else
			puts "Money must be greater than raise"
	end

	def call(value)
		if money >= bet
			return @bet
		else
			puts "Money must be greater than bet"
	end

	def fold
		@roundPlayers = array.delete(Player)
	end

	def betting_turn
		print "Enter betting action: "
		turn = gets
		if turn == "raise"
			print "Enter bet raise: "
			value = gets
			raise(value)
		elsif turn == "call"
			call
		elsif turn == "fold"
			fold
		elsif turn == "check"
			if bet == NULL
				bet = 0
			end
		end
	end
	
	def play_turn
		@field = Field.new()
		@deck = Deck.new()
		for players in roundPlayers
			betting_turn			
		end
	end
end
