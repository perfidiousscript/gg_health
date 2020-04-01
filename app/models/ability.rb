# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :profile, User
    can :create, User
    if user.present?
      can :show, User, id: user.id
      can :update, User, id: user.id
      can :search, Location
      if user.is_manager?
        can :create, [Practice, Location]
        can :manage, Practice, user_id: user.id
        can :manage, Location, practice: { user: {id: user.id} }
      end
      if user.is_admin?
        can :manage, :all
      end
    end
  end
end
