# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  age        :string
#  last_name  :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#

class Profile < ApplicationRecord
  belongs_to :user
  validates :name, presence:true
  validates :last_name, presence:true
  validates :age, presence:true
end
