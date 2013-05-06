require 'player_info.rb'

class Game

	@@players = Array.new()
	@@Number numPlayers
	@@Number bet = NULL

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

	@@roundPlayers = Game.other_array

	def raise(value)
		if Player.getMoney <= value && bet <= Player.getMoney
		bet = value
		@bet
		else
			puts "Money must be greater than bet"
	end

	def call(value)
		if money >= bet
			@bet
		else
			puts "Money must be greater than bet"
	end

	def fold
		@roundPlayers = array.delete(Player)
	end

print "Enter betting action: "
turn = gets
if turn == "raise"
	print "Enter bet raise: "
	value = gets
	raise(value)
elsif turn == "call"

elsif turn == "fold"

elsif turn == "check"
	#if no bet so far
		bet = 0
