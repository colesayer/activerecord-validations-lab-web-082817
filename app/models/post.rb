class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait_title?

  def clickbait_title?
    array = ["Won't Believe", "Secret", "Top
    [number]", "Guess"]
    if self.title
      array.each do |string|
        return if self.title.include?(string)
      end
      self.errors[:title] << "Not click baity enough."
    end
  end

  end
