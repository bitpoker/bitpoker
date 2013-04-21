# $: << File.dirname(__FILE__)
# require './menu.rb'
require File.join(DIR, 'log.rb')

Shoes.app :title => "BitPoker" do
  button "POP UP" do
    window :title => "WTF" do
      para "hi"
    end
  end
  button "log" do
    Shoes.show_log
  end
end
