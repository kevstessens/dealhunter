ActiveAdmin.register Company do

  index do
    column :id
    column :email
    column :name
    column :cuit
    default_actions
  end

  filter :email
  filter :name
  filter :cuit

  form :partial => "form"

  show do |f|
    attributes_table do
      row :id
      row :email
      row :name
      row :cuit
    end
    panel "Sucursales" do
      table_for(company.branches) do |t|
        t.column("Nombre"){ |item| item.name}
        t.column("Direccion"){|item| item.address_as_string}
      end
    end
  end

  controller do
    def create
      super
      unless @company.user.nil?
        @company.user.user_role_id = 1
        @company.save!
        NewUserMailer.new_user_email(@company.user, @company).deliver
      end
    end

  end

end