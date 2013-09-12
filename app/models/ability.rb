class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    # check if you've got a registered user
    if user.id != nil
      can [:new, :create], Group
      can [:new, :create], Event
      can [:edit, :update, :destroy], Group do |group|
        # check if the user leads the group
        user.led_group_ids.include?(group.id)
      end
      can [:edit, :update, :destroy], Event do |event|
        # check if the user leads the group which the event is for
        user.led_group_ids.include?(event.group_id)
      end
      can :manage, User, :id => user.id
    end
      # check guests can see groups and events
      can :show, Group
      can :show, Event




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
