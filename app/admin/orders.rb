ActiveAdmin.register Order do
  permit_params :order_date, :order_status_id, :total_tax, :grand_total, order_details_attributes: [:id, :product_id, :order_id, :quantity, :_destroy]

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs
    f.inputs do
      f.has_many :order_details, allow_destroy: true do |n_f|
        n_f.input :product_id
        n_f.input :quantity
      end
    end
    f.actions
  end
end
