class Book < ApplicationRecord
  include ActiveModel::Validations
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :week_favorites, -> { where(created_at: 1.week.ago.beginning_of_day..Time.current.end_of_day) }
  # has_many :favorited_users, through: :favorites, source: :user
  validates :title, presence: true
  validates :body, presence: true,length: { maximum: 200}
  
  
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end 
end

