class CreateComments < ActiveRecord::Migration
  def change #database change will happen as result of running method
    create_table :comments do |t| 
      #above line take symbol argument which represents the table name
      #also a block argument that contains the details to be added to the table
      t.text :body
      t.references :post, index: true

      t.timestamps
    end
  end
end
