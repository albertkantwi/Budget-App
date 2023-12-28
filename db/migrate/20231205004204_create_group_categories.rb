class CreateGroupCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :group_categories do |t|
      t.string :name
      t.string :icon

      t.timestamps
    end

    add_reference :group_categories, :user, null: false, foreign_key: true
  end
end