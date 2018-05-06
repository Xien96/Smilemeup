class AddLocaleAndCurrencyToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :locale, :string, default: 'en'
    add_column :users, :currency, :string, default: 'usd'
    change_column_default :users, :country, 'UK'
  end
end
