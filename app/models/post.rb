class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: {within: ["Fiction","Non-Fiction"]}
  validate :clickbait_title
  # Custom Validation

  def clickbait_title
    clickbait_keywords = ["Won't Believe", "Secret", "Top", "Guess"]
    if title.present? && !clickbait_keywords.any?{|keyword| title.include?(keyword)}
      errors.add(:title, "Not clickbaity enough!")
    end
  end

end
