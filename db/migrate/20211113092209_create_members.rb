class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :mobile_number
      t.date :joining_date
      t.timestamps
    end
  end
end
