# == Schema Information
#
# Table name: rols
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_rols_on_deleted_at  (deleted_at)
#
class Rol < ApplicationRecord
  acts_as_paranoid
end
