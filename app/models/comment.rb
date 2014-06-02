class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :post

  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true
  validates :post, presence: true

  after_create :send_favorite_emails

  private

  def send_favorite_emails
    self.post.favorites.each do |favorite|
      FavoriteMailer.new_comment(favorite.user, self.post, self).deliver
    
     if favorite.user_id != self.user_id && favorite.user.email_favorites?
         FavoriteMailer.new_comment(favorite.user, self.post, self).deliver
      end 
    end
  end
end

