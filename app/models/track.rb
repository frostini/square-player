class Track < ApplicationRecord
  has_one_attached :cover_image
  has_one_attached :full_audio
end
