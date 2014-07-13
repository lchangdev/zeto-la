module ApplicationHelper
  def sort_users(column, title = nil)
    title ||= column.titleize
    direction = column == sort_user_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(sort: column, direction: direction)
  end

  def sort_posts(column, title = nil)
    title ||= column.titleize
    direction = column == sort_post_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(sort: column, direction: direction)
  end
end
