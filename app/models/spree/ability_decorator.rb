class AbilityDecorator
  include CanCan::Ability
  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    end
    if user.respond_to?(:has_spree_role?) && user.has_spree_role?('users')
      can [:admin], Spree::User
    end

    if user.respond_to?(:has_spree_role?) && user.has_spree_role?('products')
      can [:admin], Spree::Product
    end

    if user.respond_to?(:has_spree_role?) && user.has_spree_role?('orders')
      can [:admin], Spree::Order
    end

    if user.respond_to?(:has_spree_role?) && user.has_spree_role?('customer')
      can [:admin], Spree::Order
    end

    if user.respond_to?(:has_spree_role?) && user.has_spree_role?('customer')
      can [ :manage, :all], Spree::Admin::ReportsController
    end
    
    if user.respond_to?(:has_spree_role?) && user.has_spree_role?('customer')
      can [:manage, :all], Spree::StateChange
    end
    

     
   
end
end


Spree::Ability.register_ability(AbilityDecorator)