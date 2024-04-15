class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.string :feature_id
      t.text :comment
      # Add any other columns as needed
      t.timestamps
    end
  end
end
