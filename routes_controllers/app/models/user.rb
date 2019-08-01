# == Schema Information
#
# Table name: users
#
#  id       :bigint           not null, primary key
#  username :text
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :artworks,
    foreign_key: :artist_id,
    class_name: :Artwork,
    dependent: :destroy

  has_many :viewers,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare

  has_many :artwork_shares,
    through: :artworks,
    source: :viewers,
    dependent: :destroy

  has_many :comments,
    foreign_key: :user_id,
    class_name: :Comment
end
