# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  body       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_notes_on_user_id  (user_id)
#

class Note < ApplicationRecord
  belongs_to :user
  validates :body,presence:true
  validates :title,presence:true
end
