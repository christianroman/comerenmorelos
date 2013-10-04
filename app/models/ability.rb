class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role? :super_admin
      can :manage, :all
    elsif user.role? :restaurant_admin
      #can :manage, [Restaurant, Room, Guest, Reservation]
      can :manage, Restaurant, :id => user.restaurant_id
      can :manage, Room, :restaurant_id => user.restaurant_id
      can :manage, Guest
      can :manage, Reservation, :restaurant_id => user.restaurant_id
      can :manage, Contact, :restaurant_id => user.restaurant_id
      can :manage, Availability, :restaurant_id => user.restaurant_id
      can :update, User, :id => user.id
    elsif user.role? :restaurant_staff
      #can :read, [Restaurant, Room, Guest, Reservation]
      can :read, Restaurant, :id => user.restaurant_id
      can :read, Room, :restaurant_id => user.restaurant_id
      can :read, Guest
      can :read, Reservation, :restaurant_id => user.restaurant_id
      can :read, Contact, :restaurant_id => user.restaurant_id
      can :read, Availability, :restaurant_id => user.restaurant_id
    end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
