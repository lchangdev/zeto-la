module ApplicationHelper
  def sort_users(column, title = nil)
    title ||= column.titleize
    direction = column == sort_user_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(sort: column, direction: direction)
  end

  def concat_cohort(cohort)
    cohort.gsub(/\s+/, "").downcase
  end
end
