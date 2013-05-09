class UserSession < ActiveRecord::Base
  attr_accessible :username, :password

  def to_key
    new_record? ? nil : [ self.send(self.class.primary_key) ]
  end

  def persisted?
    false
  end
end
