class CreateUserTitles < ActiveRecord::Migration
  def up
    if ActiveRecord::Base.connection.table_exists? :titles_users
      drop_table :titles_users
    end
    create_table :user_titles, id: false do |t|
      t.references :user
      t.references :title
    end
  end

  def down
    create_table :titles_users do |t|
      t.belongs_to :title
      t.belongs_to :user
    end
    drop_table :user_titles
  end
end
