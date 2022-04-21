class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  after_initialize :init

  def init
    # Gets called right after Model.new
    self.author ||= 'Craig J. Bellamy'
  end
end
