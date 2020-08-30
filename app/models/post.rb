# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  deleted_at  :datetime
#  description :text(65535)
#  title       :string(255)
#  url_movie   :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_posts_on_deleted_at  (deleted_at)
#  index_posts_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  has_and_belongs_to_many :challenges, dependent: :destroy
  has_one_attached :movie
  has_one_attached :photo #, file_size: { less_than_or_equal_to: 500.kilobytes }, file_content_type: { allow: ['image/jpeg', 'image/png'] }
  validates_presence_of :movie

  def valid_url
    return if self.url_movie.blank?
    begin
      uri = URI.parse(self.url_movie)
      resp = uri.kind_of?(URI::HTTP)
    rescue URI::InvalidURIError
      resp = false
    end
    unless resp == true
      self.errors[:url_movie] << ("is not an url")
    end
  end

  def movie_url
    if self.movie.attachment
      self.movie.service_url
    else
      nil
    end
  end

  def photo_url
    if self.photo.attachment
      self.photo.service_url
    else
      nil
    end
  end
end
