module BadgesHelper
  def achieved?(badge)
    current_user.badges.exists?(badge.id)
  end
end
