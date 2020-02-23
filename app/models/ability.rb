# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new
    case @user.role
    when "admin"
      can :manage, Cab # additional permissions for administrators
    else
      can :read, Cab
    end
    # if @user.present?
    #   can :read, Cab
    #   can :manage, Cab if @user.admin?
    # end
  end
end
