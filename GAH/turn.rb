require_relative 'player_info.rb'
require_relative 'cards.rb'

class Game
	attr_accessor :players
	attr_accessor :num_players
	attr_accessor :bet
	attr_accessor :field
	attr_accessor :deck

	# Create the game object
	def initialize(players)
		@players = Array.new(players)
	end

	def list_players
		for player in players
			puts player
		end
		puts "Number of players: #{players.size}"
	end

	# Add a player to the array
	def add_player(player)
		if players.size < 7 # Why is this value hardcoded? ~William
			players << player
		end
	end

	# Remove a player from the array
	def rm_player(player)
		if players.include?(player)
			players.delete(player)
			# If there are multiple players by the same name, the
			# above deletes all of them. ~William
		end
	end

	# Place a higher bet than previous players
	def raise(value)
		if (Player.get_money >= value and value >= bet)
			@bet = value
			return @value
		else
			puts "Money must be greater than raise and raise must be greater than bet"
		end
	end

	# Match the bet of a previous player
	def call(value)
		if money >= bet
			return @bet
		else
			puts "Money must be greater than bet"
		end
	end

	def betting_round
		for player in players
			@roundPlayers = Array.new(players)
			print "Enter betting action: "
			turn = gets
			if turn == "raise"
				print "Enter bet raise: "
				value = gets
				raise(value)
			elsif turn == "call"
				call
			elsif turn == "fold"
				@roundPlayers = array.delete(player)
			elsif turn == "check"
				if bet == NULL
					bet = 0
				end
			end
		end
	end

	def play_turn
		@deck = Deck.new()
		betting_round
	end
end
