class AddArticlesPrivate < ActiveRecord::Migration[5.2]
  def change
    add_column :articles,:private,:boolean,default: true,null:false
  end
end
