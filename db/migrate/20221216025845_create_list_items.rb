class CreateListItems < ActiveRecord::Migration[7.0]
  def change
    create_table :list_items do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :class_name

      t.timestamps
    end
  end
end
