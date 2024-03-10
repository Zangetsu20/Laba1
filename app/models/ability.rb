class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # гость

    if user.has_role? :instructor
      can :manage, Style
    elsif user.has_role? :user
      can :read, Style
    end
  end
end