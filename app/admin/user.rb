ActiveAdmin.register User do

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :company
    end
    f.actions
  end
end
