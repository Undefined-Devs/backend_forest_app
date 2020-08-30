# == Schema Information
#
# Table name: challenges
#
#  id          :bigint           not null, primary key
#  deleted_at  :datetime
#  description :text(65535)
#  name        :string(255)
#  points      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_challenges_on_deleted_at  (deleted_at)
#
class Challenge < ApplicationRecord
  acts_as_paranoid
  has_and_belongs_to_many :posts, dependent: :destroy
end
