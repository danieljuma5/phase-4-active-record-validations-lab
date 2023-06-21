class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: {within: ["Fiction","Non-Fiction"]}
  validate :dont_allow_true_facts
  # Custom Validation

  def dont_allow_true_facts
    if title == "True Facts"
      errors.add(:title, "Title cannot be True Facts")
    end
  end

end
