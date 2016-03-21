module SiteHelper

  def get_user_by_id(user_id)
    User.find(user_id)
  end


end
