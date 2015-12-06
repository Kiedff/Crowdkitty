class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :update, :destroy, :to => :cud

    user ||= User.new

    if user.role? :admin
      can :manage, :all
    elsif user.role? :user
      can :cud, Project, :user_id => user.id  
      can :cud, Reward # needs restrictions added 
      can :cud, Picture # needs restrictions added 
      can :create, Pledge 
      can :update, User
      can :read, :all
      can :welcome, :Home
    else
      can :read, :all
    end
  end
end


