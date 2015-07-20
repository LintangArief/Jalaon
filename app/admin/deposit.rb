ActiveAdmin.register Deposit do
  menu parent: "Transaction" 
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
    column "Id Deposit", :token
    column "Pemohon" do |usr|
      user = User.find(usr.user_id)
      link_to "#{user.first_name} #{user.last_name}", admin_user_path(usr.user_id)
    end
    column "Request Deposit", :money
    column "Status" do|deposit|
      if deposit.status == 1
        status = "Menunggu Transfer"
      elsif deposit.status == 2
        status = "Menunggu Pengisian"
      else
        status = "Success"
      end
      link_to status, "#"
    end
    column "Pada Tanggal", :created_at
    column "Trash?", :trash
  end

end
