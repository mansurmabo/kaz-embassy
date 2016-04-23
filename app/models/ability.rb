class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user
    if user.role == 'admin'
      can :manage, :all
    elsif user.role == 'moder'
      can :read, :all
      can :manage, Article
      can :manage, Category
      can :manage, Type
      can :manage, Page
      can :manage, ThirdParty
      can :manage, Gallery
      can :manage, ImagesCategory
      can :manage, Event
      can :manage, User, :id => user.id
    else
      can :manage, :all
    end

  end
end
