class Player

	@@Characters username
	@@Number money

	def initialize(username, money)
		@username=username
		@money=money	
	end

	def getName()
		@username
	end
	
	def getMoney()
		@money
	end
end	
