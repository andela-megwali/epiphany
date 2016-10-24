class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :bucketlist, index: true, foreign_key: true
      t.string :title
      t.boolean :complete

      t.timestamps null: false
    end
  end
end
