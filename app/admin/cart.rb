ActiveAdmin.register Cart do
  menu parent: "Transaction", label: "Current Transaction"
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
#<Cart id: nil, created_at: nil, updated_at: nil, user_id: nil, service_id: nil> 
  index do
    selectable_column
    id_column
    column "Pemilik Cart" do |usr|
      user = User.find(usr.user_id)
      link_to "#{user.first_name} #{user.last_name}", admin_user_path(usr.user_id)
    end
    
    column "Service" do |srvc|
      service = Service.find(srvc.service_id)
      link_to "#{service.title}", admin_service_path(srvc.service_id)    
    end

    column "Jumlah Order Product" do |ttl|
      link_to ttl.cart_items.count, "#"    
    end

    column "Pada Tanggal", :created_at
  end

end
