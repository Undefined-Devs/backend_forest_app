class Ability
  include CanCan::Ability
  def initialize(user)
    if !user.nil?
      can [:create], [Profile,Note]
      can [:update,:read], [Profile,Note], {user_id: user.id}
      cannot [:destroy], [Profile]
      can :destroy, Note, {user_id:user.id}
    end
  end
end