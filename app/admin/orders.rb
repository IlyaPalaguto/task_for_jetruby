ActiveAdmin.register Order do
  config.filters = false
  
  belongs_to :user, optional: true
  belongs_to :package, optional: true
  belongs_to :route, optional: true
  
  includes :route

  permit_params :user_id,
                :status,
                :id,
                :package_id,
                :route_id,
                route_attributes: [:destination, :departure_point, :distance, :id],
                package_attributes: [:width, :length, :height, :weight, :size, :id]

  controller do
    def scoped_collection
      super.includes :route, :package
    end
  end

  member_action :confirm, method: :put do
    resource.confirm!
    redirect_to admin_orders_path, notice: "Status successfully changed!"
  end

  member_action :deliver, method: :put do
    resource.deliver!
    redirect_to admin_orders_path, notice: "Status successfully changed!"
  end

  action_item :status, priority: 0, only: :index do
    link_to 'View on site', orders_path
  end

  form :html => { :multipart => true } do |f|
    f.inputs "General" do
      f.input :id, as: :string, input_html: { readonly: true, disabled: true }
      f.input :status
      f.input :created_at, as: :string, input_html: { readonly: true, disabled: true }
    end
  
    f.inputs "Route details", :for => [:route, f.object.route || Route.new ] do |fm|
      fm.input :destination
      fm.input :departure_point
      fm.input :distance, as: :string, input_html: { readonly: true, disabled: true }
    end

    f.inputs "Package details", for: [:package, f.object.package || Package.new] do |pack|
      pack.input :width
      pack.input :length
      pack.input :height
      pack.input :weight
      pack.input :size, as: :string, input_html: { readonly: true, disabled: true }
    end

    f.inputs "Calculation" do
      f.input :rate, as: :string, input_html: { readonly: true, disabled: true }
      f.input :price, as: :string, input_html: { readonly: true, disabled: true }
    end

    f.actions
  end

  index row_class: ->elem { elem.status } do
    selectable_column
    index_column
    column 'Route', :route_text
    column :distance, sortable: 'routes.distance'
    column :package_size, sortable: 'packages.size'
    column :rate
    column :price
    column :created_at
    column :status

    actions defaults: false do |order|
      item "Confirm", confirm_admin_order_path(order), method: :put, class: 'member_link' if order.may_confirm?
      item "Deliver", deliver_admin_order_path(order), method: :put, class: 'member_link' if order.may_deliver?
      a "Edit", href: edit_admin_order_path(order)
    end
  end
end
