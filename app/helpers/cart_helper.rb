module CartHelper
  def option_for_category(current_select)
    options_for_select(CategoryServices::QueryCategory.query_category_name_with_id, current_select)
    # options_for_select(["All"] + Category.all.pluck(:name, :id), current_select)
  end
end
