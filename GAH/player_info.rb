class Player

	@@Characters username
	@@Number money

	def initialize(username, money)
		@username = username
		@money = money	
	end

	def getName()
		return @username
	end
	
	def getMoney()
		return @money
	end
end	
