ActiveAdmin.register Order do
  permit_params :order_date, :order_status_id, :total_tax, :grand_total

  form do |f|
    f.semantic_errors
    f.inputs
    f.actions
  end
end
