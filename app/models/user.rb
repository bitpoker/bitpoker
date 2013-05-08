class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation

  acts_as_authentic do |c|
    # set minimum password value to 8
    c.merge_validates_length_of_password_field_options({:minimum => 8})
  end

end
