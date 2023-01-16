class Article < ApplicationRecord
    include Visible

    belongs_to :user

    has_many :comments, dependent: :destroy
  
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
    validates :user_id, presence: true

    scope :public_posts, -> { where(status: 'public') }
    scope :order_by_date, ->(sort = "asc") {reorder("created_at #{sort}")}
  end
  