class CreateGroupCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :group_categories do |t|

      t.timestamps
    end
  end
end
