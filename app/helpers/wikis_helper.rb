module WikisHelper
  def user_can_delete_and_add_collaborators?(wiki)
    current_user && (current_user == wiki.user || current_user.admin?)
  end
end
