class CreateEntityCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :entity_categories do |t|

      t.timestamps
    end
  end
end
