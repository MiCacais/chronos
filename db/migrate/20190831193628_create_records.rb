class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :time
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
