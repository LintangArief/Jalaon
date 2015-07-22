ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do    
    columns do
      column do
        panel "Recent Services" do
          span link_to("View All Services", admin_services_path)
          table_for Service.order('RANDOM()').limit(10) do
            column("Title") { |service| status_tag(service.title) }
            column("Owner") { |service| link_to("#{service.user.first_name} #{service.user.last_name}", admin_service_path(service)) }
          end
        end
      end

      column do
        panel "Recent Users" do
          span link_to("View All Users", admin_users_path)
          table_for User.order('RANDOM()').limit(10) do
            column("Name") { |user| status_tag("#{user.first_name} #{user.last_name}") }
            column("Register At") { |user| link_to("#{user.created_at}", admin_user_path(user)) }
            column("Last Sign In") { |user| link_to("#{user.last_sign_in_at}", admin_user_path(user)) }

          end
        end
      end
    end
    columns do
      column do
        panel "Last Transaction" do
          span link_to("View All Transaction", admin_carts_path)
          table_for Cart.order('created_at DESC').limit(10) do
            column("Costumers") { |cart| link_to("#{cart.user.first_name} #{cart.user.last_name}", admin_cart_path(cart)) }
            column("Order Count Product") { |cart| link_to("#{cart.total_unique_items}", admin_cart_path(cart)) }
            column("Service") {|cart| link_to(cart.service.title, admin_service_path(cart.service_id))}
            column("At") {|cart| link_to(cart.created_at, admin_cart_path(cart))}
          end
        end
      end

      column do
        panel "Recent Request Deposit" do
          span link_to("View All Data Deposit", admin_deposits_path)
          table_for Deposit.where(trash: false).order('RANDOM()').limit(10) do
            column("Name") { |deposit| link_to("#{deposit.user.first_name} #{deposit.user.last_name}", admin_user_path(deposit.user_id)) }
            column("Request $") { |deposit| link_to("#{deposit.money}", admin_deposit_path(deposit)) }
            column("Status") { |deposit|
              if deposit.status == 1
                status = "Menunggu Transfer"
              elsif deposit.status == 2
                status = "Menunggu Pengisian"
              else
                status = "Success"
              end
              status_tag(status)
            }
            column("Created At") { |deposit| link_to("#{deposit.created_at}", admin_deposit_path(deposit)) }
          end
        end
      end
    end
  end
end
