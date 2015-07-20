class AddAddressToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :address, :string
    add_column :companies, :neighborhood, :string
    add_column :companies, :email, :string
  end
end
