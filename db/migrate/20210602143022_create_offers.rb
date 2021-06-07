class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.date :start_date
      t.date :end_date
      t.string :address
      t.integer :fee
      t.string :status
      t.references  :user, foreign_key: true

      t.timestamps
    end
  end
end
