ActiveAdmin.register Offer do

  actions :all, :except => [:new, :edit]

  index do
    column :id
    column :name
    column :company
    column :branch
    default_actions
  end

  filter :name
  filter :company
  filter :branch

  form :partial => "form"

  show do |f|
    attributes_table do
      row :id
      row :name
      row :company
      row :branch
      row :start_date
      row :end_date
      row ("Foto"){
        (image_tag(offer.photo_url(:thumb))) if !offer.photo.nil?
      }
    end
    panel "Premios" do
      table_for(offer.prizes) do |t|
        t.column("Nombre"){ |item| item.name}
        t.column("Precio Real"){|item| item.real_price}
        t.column("Porcentaje de Descuento"){|item| item.discount_percentage}
      end
    end
    panel "Inscriptos" do
      table_for(offer.clients) do |c|
        c.column("Mail"){|o| o.user.email }
        c.column("Nombre"){|o| o.first_name }
        c.column("Apellido"){|o| o.last_name }
      end
    end
  end

end