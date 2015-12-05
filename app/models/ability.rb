class Ability
  include CanCan::Ability

  def initialize(user)
    def initialize(user)
      alias_action :create, :update, :destroy, :to => :cud

      user ||= User.new
      if user.role? :admin
        can :manage, :all
      elsif user.role? :user
        can :read, :all
        can :cud, Project, :user_id => user.id  
        can :cud, Reward # needs resrictions added 
        can :cud, Picture # needs resrictions added 
        can :create, Pledge 
      else
        can :read, :all
      end
    end
  end
end