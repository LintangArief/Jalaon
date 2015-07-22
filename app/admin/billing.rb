ActiveAdmin.register Billing do
  menu parent: "Payment", label: "Data Billing Credit"
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
    column "Nama Account", :owner
    column :created_at
    column :account_number
    column :branch
    column :city
    column "User" do |usr|
      user = User.find(usr.user_id)
      link_to "#{user.first_name} #{user.last_name}", admin_user_path(usr.user_id)
    end
  end

end
