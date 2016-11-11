class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user
    if user.role == 'admin'
      can :manage, :all
    elsif user.role == 'moder'
      can :read, :all
      can :manage, Article
      can :manage, Citizen
      can :manage, Category
      can :manage, Type
      can :manage, Page
      can :manage, ThirdParty
      can :manage, Gallery
      can :manage, ImagesCategory
      can :manage, Event
      can :manage, Manifesto
      can :manage, Headline
      can :manage, CoEvent
      can :manage, User, :id => user.id
    else
      can :read, :all
    end

  end
end
