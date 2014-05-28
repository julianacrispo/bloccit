class AddUserToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :user_id, :integer
     add_index :posts, :user_id
  end
end


# id  title     body
# 1   asdfasf   qwerqwer
# 2   


# id name    email
# 1  adam     adam@louis.add_column
# 2  juliana juliana@gmail.com