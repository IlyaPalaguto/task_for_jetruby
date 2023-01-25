ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  includes :package, :route
  
  belongs_to :user, optional: true

  permit_params :user_id,
                :status,
                route_attributes: [:destination, :departure_point],
                package_attributes: [:width, :length, :height, :weight]

  form do |f|
    f.inputs 'Details' do
      f.input :id
      f.input :status
      f.input :created_at
    end
    f.inputs "Route details", :for => [:route || Order.route.new ] do |r|
      r.input :destination
      r.input :departure_point
      r.input :distance
    end
    f.inputs "Package details", :for => [:package || Order.package.new ] do |pack|
      pack.input :width
      pack.input :length
      pack.input :height
      pack.input :weight
    end
    f.inputs 'Calculation' do
      f.input :rate
      f.input :price
    end
    # f.inputs do
    #   f.has_many :taggings, sortable: :position, sortable_start: 1 do |t|
    #     t.input :tag
    #   end
    # end
    # f.inputs do
    #   f.has_many :comments,
    #               new_record: 'Leave Comment',
    #               remove_record: 'Remove Comment',
    #               allow_destroy: -> (c) { c.author?(current_admin_user) } do |b|
    #     b.input :body
    #   end
    # end
    f.actions
  end

  # index as: :block do |order|
  #   div for: order do
  #     resource_selection_cell order
  #     h2  auto_link     order.user.first_name
  #     div simple_format order.rate
  #   end
  # end

  # index as: :blog do
  #   title :user # Calls #my_title on each resource
  #   body  :rate  # Calls #my_body on each resource
  # end

  # controller do
  #   def scoped_collection
  #     end_of_association_chain.where(visibility: true)
  #   end
  # end
  # or
  #
  # permit_params do
  #   permitted = [:weight, :length, :width, :height, :departure_point, :destination, :distance, :size, :price, :rate, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
