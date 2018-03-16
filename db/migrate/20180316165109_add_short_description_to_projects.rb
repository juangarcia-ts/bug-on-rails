class AddShortDescriptionToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :short_description, :text
  end
end
