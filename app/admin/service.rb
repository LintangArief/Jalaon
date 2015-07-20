ActiveAdmin.register Service do
  menu parent: "MainService", label: "Listing Services"
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

  index do
    selectable_column
    id_column
    column "User" do |usr|
      user = User.find(usr.user_id)
      link_to "#{user.first_name} #{user.last_name}", admin_user_path(usr.user_id)
    end
    column :title
    column :description
    column "Link Logo", :avatar
    column :properties
    column :address
    column :latitude
    column :longitude
    column "Product" do |srvc|
      service = Service.find(srvc.id)
      link_to "#{service.product_services.count}", "#"
      # admin_product_service_path(srvc.service_id)    
    end

  end

end
