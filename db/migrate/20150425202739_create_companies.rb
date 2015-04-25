class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|

      t.string   :name
      t.string   :code
      t.string   :site
      t.string   :phone
      t.boolean  :delivery
      t.boolean  :multi_prices
      t.decimal  :price, precision: 7, scale: 2, default: 0
      t.datetime :date_display
      t.timestamps
    end
  end
end
