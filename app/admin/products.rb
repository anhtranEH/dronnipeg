ActiveAdmin.register Product do
  permit_params :name, :price, :description, :battery_life, :category_id, :image

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :image, as: :file
    end
    f.actions
  end
end
