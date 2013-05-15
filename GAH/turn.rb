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
		for players in roundPlayers
			print "Enter betting action: "
				turn = gets
			if turn == "raise"
				print "Enter bet raise: "
				value = gets
				raise(value)
			elsif turn == "call"

			elsif turn == "fold"

			elsif turn == "check"
				if bet == NULL
					bet = 0
			end
		end
	end
	
	def play_turn
		current_field = Field.new()
		while current_field.field.size < 6
			#current_field.add_to_field random cards
		end
		for players in roundPlayers
		
		end
	end
end
