class Company < ActiveRecord::Base

  attr_accessible :name, :code, :site, :phone, :delivery, :multi_prices, :price, :date_display

end
