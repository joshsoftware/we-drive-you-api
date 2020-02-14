# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?  # apermissions for logged in users (they can view cabs of their organization)
      can :read, Cab 
      if user.is_admin? # additional permissions for administrators
        can :manage, Cab
      end
    end
  end
  
end
