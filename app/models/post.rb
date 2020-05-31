class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  # default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 100000 }
  def increment(by = 1)
    self.view ||= 0
    self.view += by
    self.save
  end
end
