class AddCategoryToUserActivity < ActiveRecord::Migration[5.2]
  def change
    add_column :user_activities, :category, :string
  end
end
