ActiveAdmin.register Balance do
  menu parent: "Payment", label: "Data Balance Users"
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
    column 'Owner' do |usr|
      user = User.find(usr.user_id)
      link_to "#{user.first_name} #{user.last_name}", admin_user_path(usr.user_id)
    end
    column "Balance", :money
    column "Terdaftar", :created_at    
  end
end
