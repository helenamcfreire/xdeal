class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|

      t.string   :name
      t.string   :code
      t.string   :site
      t.string   :phone
      t.boolean  :delivery
      t.boolean  :multi_prices
      t.decimal  :money_dolar, precision: 7, scale: 2, default: 0
      t.decimal  :visa_dolar, precision: 7, scale: 2, default: 0
      t.decimal  :master_dolar, precision: 7, scale: 2, default: 0
      t.decimal  :money_euro, precision: 7, scale: 2, default: 0
      t.decimal  :visa_euro, precision: 7, scale: 2, default: 0
      t.decimal  :master_euro, precision: 7, scale: 2, default: 0
      t.decimal  :money_libra, precision: 7, scale: 2, default: 0
      t.decimal  :visa_libra, precision: 7, scale: 2, default: 0
      t.decimal  :master_libra, precision: 7, scale: 2, default: 0
      t.decimal  :money_peso, precision: 7, scale: 2, default: 0
      t.decimal  :visa_peso, precision: 7, scale: 2, default: 0
      t.decimal  :master_peso, precision: 7, scale: 2, default: 0
      t.datetime :date_display
      t.timestamps
    end
  end
end
