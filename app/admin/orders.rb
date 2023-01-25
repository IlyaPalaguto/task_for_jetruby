ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  includes :package, :route
  
  belongs_to :user, optional: true

  permit_params :user_id, :status

  # or
  #
  # permit_params do
  #   permitted = [:weight, :length, :width, :height, :departure_point, :destination, :distance, :size, :price, :rate, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
