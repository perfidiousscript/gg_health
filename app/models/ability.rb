# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :create, User
    if user.present?
      can :show, User, id: user.id
      can :update, User, id: user.id
      can :search, Location
    end
    if user.manager?
      can :create, [Practice, Location]
      can :manage, Practice, user_id: user.id
      can :update, Location, practice: { user: {id: user.id} }
    end
    if user.admin?
      can :manage, :all
    end
  end
end
