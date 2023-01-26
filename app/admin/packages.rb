ActiveAdmin.register Package do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #

  permit_params :width, :weight, :length, :height, :order_id
  menu false

  #
  # or
  #
  # permit_params do
  #   permitted = [:width, :weight, :length, :height, :size, :order_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
