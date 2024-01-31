class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can :read, Category
      can :read, Item
      can :create, Category
      can :create, Item
      can :update, Category, user_id: user.id
      can :update, Item, category: { user_id: user.id }
      can :destroy, Category, user_id: user.id
      can :destroy, Item, category: { user_id: user.id }
    end
  end
end
