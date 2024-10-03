class Quote < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_one_attached :audio_data
  belongs_to :person

  validates :audio_data, presence: true

  def audio_url
    polymorphic_url(audio_data, only_path: true)
  end
end
