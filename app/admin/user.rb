ActiveAdmin.register User do
  menu parent: "People", label: "Data Users"

  scope :all, :default => true
  scope "Belum Terverifikasi", :not_verify
  scope "Sudah Terverifikasi", :success_verify

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


end
