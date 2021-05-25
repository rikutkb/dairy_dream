class AddCitationsToTag < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :citations, :integer,default:0
  end
end
