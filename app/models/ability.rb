class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new ## allowing visitors
    ## admin can do all
    if user.admin? 
      can :manage, :all
    else
      can :read, User
      can :manage, User do |u|
        u.id == user.id 
      end
      ## visitor can read posts
      can :read, Post
      ## Posts can be updated only by onwer of post
      ### cancan does not check the block when it is class!
      if user.lastname.kind_of?(String)
        can [:edit, :update], Post do |post|
          post.try(:user) == user
        end
      end

      ## Only logged in users can create replies
      ## is not working... I think is now works
      if user.lastname.kind_of?(String)
        can [:new, :create], [Reply, Post]
 #       can :create, Reply
      end
      ## Only logged in users can create posts
   ## This code does not work! i donot know why...
#      cannot :create, Post do |post|
#        user.lastname != nil
#        user.lastname.nil?
#      end

      ## Replies can be updated only by onwer of reply
      # can :update, Reply do |reply|
      #   post.try(:user) == user
      # end

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
