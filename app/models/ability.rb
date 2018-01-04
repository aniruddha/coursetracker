class Ability 
  include CanCan::Ability

  def initialize(user)


    # :create - new, create
    # :read - index, show
    # :update - edit, update
    # :destroy - destroy
    # :manage - new, create, index, show, edit, update, destroy

    if user.nil? # user not logged in
        can :read, [Course, Instructor, Publication]
    elsif user.role? "admin"
        can [:manage], [Course, Instructor, Student, Publication]
    elsif user.role? "receptionist"
        can :read, [Course, Instructor, Publication]
        can [:create, :read, :update], Student
        #can [:create, :update], Instructor
    elsif user.role? "instructor"
        can [:read, :update], Course
        can :read, [Instructor, Student]
        can [:read, :create], Publication
        can [:update, :destroy], Publication do |publication|
            publication.user_id == user.id
        end
    elsif user.role? "student"
        can :read, [Course, Instructor, Publication]
    elsif user.role? "guest"
        can :read, [Course, Instructor, Publication]
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
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
