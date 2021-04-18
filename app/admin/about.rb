ActiveAdmin.register_page "About" do
  # page_action :index, method: :post do
  #   # do some logic using params['my_field']
  #   redirect_to "/"
  # end

  content do
    form action: "about/index", method: :post do |f|
      f.input :my_field, type: :text, name: 'my_field'
      f.input :submit, type: :submit
    end
  end
end
