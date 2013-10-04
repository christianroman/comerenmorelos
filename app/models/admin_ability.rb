class AdminAbility
  include CanCan::Ability

  def initialize(user)
      if user.role? :super_admin
	  can :manage, :all
      end
  end
end
