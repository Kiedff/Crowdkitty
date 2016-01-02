class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :update, :destroy, :to => :cud

    user ||= User.new
    can :autocomplete_locations, Project

    if user.role? :admin
      can :manage, :all
    elsif user.role? :user
      can :create, Project 
      can :update, Project, :user_id => user.id 
      can :destroy, Project, :user_id => user.id 
      can :cud, Reward # needs restrictions added 
      can :cud, Picture # needs restrictions added 
      can :create, Pledge 
      can :update, User, :id => user.id 
      can :read, :all
      can :create, Comment
      can :destroy, Comment, :user_id => user.id 
    else
      can :read, :all
    end
    
  end
end


