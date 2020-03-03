# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :create, User
    if user.consumer?
      can :show, User, id: user.id
      can :update, User, id: user.id
    end
    if user.manager?
      can :update, Practice, user_id: user.id
      #can :update, Location, id: user.id
    end
    if user.admin?
      can :read, :all
      can :manage, :all
    end
  end
end
