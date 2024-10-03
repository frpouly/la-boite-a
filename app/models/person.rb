class Person < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_one_attached :picture
  has_many :quotes

  validates :picture, presence: true

  def picture_url
    polymorphic_url(picture, only_path: true)
  end
end
