class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
  
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :articles

  scope :users_with_articles, -> { joins(:articles).group('user_id')}
end
