module CategoryServices
  class QueryCategory
    def self.query_category_name_with_id
      ["All"] + Category.all.pluck(:name, :id)
    end
  end
end
