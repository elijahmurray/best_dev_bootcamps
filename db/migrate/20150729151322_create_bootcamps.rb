class CreateBootcamps < ActiveRecord::Migration
  def change
    create_table :bootcamps do |t|
      t.string :name
      t.integer :rating

      t.timestamps
    end
  end
end
