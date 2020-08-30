# == Schema Information
#
# Table name: challenges_posts
#
#  id           :bigint           not null, primary key
#  deleted_at   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  challenge_id :bigint           not null
#  post_id      :bigint           not null
#
# Indexes
#
#  index_challenges_posts_on_challenge_id              (challenge_id)
#  index_challenges_posts_on_deleted_at                (deleted_at)
#  index_challenges_posts_on_post_id                   (post_id)
#  index_challenges_posts_on_post_id_and_challenge_id  (post_id,challenge_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (challenge_id => challenges.id)
#  fk_rails_...  (post_id => posts.id)
#
class ChallengesPost < ApplicationRecord
  acts_as_paranoid
  belongs_to :post
  belongs_to :challenge
end
