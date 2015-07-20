class Company < ActiveRecord::Base

  attr_accessible :name, :code, :site, :phone, :address, :neighborhood, :email, :delivery, :multi_prices, :date_display,
                  :money_dolar, :visa_dolar, :master_dolar, :money_euro, :visa_euro, :master_euro,
                  :money_libra, :visa_libra, :master_libra, :money_peso, :visa_peso, :master_peso

  has_many :users

end
