class Artigo < ApplicationRecord
  extend FriendlyId
  mount_uploader :capa, AvatarUploader

  belongs_to :user, optional: true
  friendly_id :titulo, use: :slugged

end
