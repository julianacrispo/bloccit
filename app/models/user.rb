class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :posts
  mount_uploader :avatar, AvatarUploader #for carrierwave to assist in uploading

  def role?(base_role)
    role == base_role.to_s
  end
end
