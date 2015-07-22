ActiveAdmin.register Coupon do
  menu parent: "Payment", label: "Data Coupon"
  index do
    selectable_column
    column "Code Coupon", :token
    column "Money Result", :money
    column "Aktif Date", :start_at
    column "Expire Date", :end_at
    column "Limit User", :limit_user
    column "Created At", :created_at
  end
end