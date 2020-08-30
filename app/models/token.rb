# == Schema Information
#
# Table name: tokens
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  expires_at :string(255)
#  token      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_tokens_on_deleted_at  (deleted_at)
#  index_tokens_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Token < ApplicationRecord
  belongs_to :user
  before_create :generate_token
  validates :user_id, presence:true
  def is_valid?
    DateTime.now < self.expires_at
  end
  private
  def generate_token
    begin
      self.token = SecureRandom.hex(20)
    end while Token.where(token: self.token).any?
    self.expires_at ||= 1.month.from_now
  end
end
