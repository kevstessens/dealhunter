ActiveAdmin.register User do
  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  filter :email

  form do |f|
    f.inputs "User Info" do
      f.input :email
    end
    f.actions
  end


  show do |user|
    attributes_table do
      row :id
      row :email
      unless user.user_role_id == 2
        row("Empresa"){
          Company.where("user_id = ?", user.id).first().name
        }
      end
      row("Tipo de usuario"){
        if user.user_role_id == 2
          "Cliente"
        else if user.user_role_id == 1
        "Administrador de empresa"
             end
        end

      }
    end
    active_admin_comments

  end

end
