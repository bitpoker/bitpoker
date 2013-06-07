class User
    attr_accessor :username
    attr_accessor :money

    # Create the user object
    # Example usage:
    # bob = User.new("bob",9000)
    def initialize(username, money)
        @username = username
        @money = money
    end

    def get_name
        return @username
    end

    def get_money
        return @money
    end

    def update_name(username)
        @username = username
    end

    def update_money(money)
        @money = money
    end
end
