class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :description
      t.string :map

      t.timestamps
    end
  end
end
