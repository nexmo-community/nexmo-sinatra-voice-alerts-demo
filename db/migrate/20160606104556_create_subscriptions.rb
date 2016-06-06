class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :name
      t.string :number
      t.string :postcode
    end
  end
end
