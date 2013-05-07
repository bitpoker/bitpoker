class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation

  acts_as_authentic do |c|
    # set minimum password value to 8
    c.merge_validates_length_of_password_field_options({:minimum => 8})
  end

  # regex to require good password
  validates_format_of :password, :with => /^(?=.\d)(?=.([a-z]|[A-Z]))([\x20-\x7E]){8,40}$/, :if => :require_password?, :message => "must include one number, one letter, and be between 6 and 40 characters"

end
