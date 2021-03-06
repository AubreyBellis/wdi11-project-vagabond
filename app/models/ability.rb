class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, Post, City

    can [:create, :update, :destroy], Post do |post|
      post.user_id == user.id
    end

    can [:create, :update, :destroy], City do |city|
      # user.admin
    end
  end
end
