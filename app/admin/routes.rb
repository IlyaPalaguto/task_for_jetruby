ActiveAdmin.register Route do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  belongs_to :order

  permit_params :destination, :departure_point, :order_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:destination, :departure_point, :distance, :order_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
