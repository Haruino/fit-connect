module ApplicationHelper
  
  def link_to_group(group)
    if user_signed_in?
      link_to group.title, group_path(group)
    else
      group.title
    end
  end
end
