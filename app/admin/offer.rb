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
      row :photo
    end
    panel "Premios" do
      table_for(offer.prizes) do |t|
        t.column("Nombre"){ |item| item.name}
        t.column("Precio Real"){|item| item.real_price}
        t.column("Porcentaje de Descuento"){|item| item.discount_percentage}
      end
    end
  end

end