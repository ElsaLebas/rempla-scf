class CreateApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :applications do |t|
      t.string :status
      t.references  :user, foreign_key: true
      t.references  :offer, foreign_key: true

      t.timestamps
    end
  end
end
