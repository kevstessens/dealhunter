ActiveAdmin.register_page "Estadisticas" do

  content do
    render "admin/statistics/statistics", :locals => {:u => "hola"}
  end



end