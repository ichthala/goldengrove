class CreatePoems < ActiveRecord::Migration
  def change
    create_table :poems do |t|
      t.text :text
      t.string :source_user

      t.timestamps
    end
  end
end
