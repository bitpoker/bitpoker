$: << File.dirname(__FILE__)

Shoes.app :title => "BitPoker" do
  menu
end

def menu
  stack :align => "center" do
    title "BitPoker!"
    button "View Log" do
      Shoes.system_log
    end
  end
end
