# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  age        :string(255)
#  deleted_at :datetime
#  last_name  :string(255)
#  name       :string(255)
#  points     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_profiles_on_deleted_at  (deleted_at)
#  index_profiles_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Profile < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  validates :name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
end
