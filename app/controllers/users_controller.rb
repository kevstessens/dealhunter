class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    session[:body]='page-micuenta'
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    session[:body]='page-micuenta'

    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    session[:body]='page-micuenta'
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    session[:body]='page-micuenta'
    @user = User.new(params[:user])
    @user.user_role = UserRole.where("name = ?", "ClientUSer" ).first()
    respond_to do |format|
      if @user.save
        @client = Client.new
        @client.user = @user
        @client.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update

    @user = User.find(params[:id])
    respond_to do |format|
    if @user.user_role_id == 2
      client = @user.client
      client_attr = params[:user][:client_attributes]
      address_attr = client_attr[:address_attributes]
      client.first_name = client_attr[:first_name]
      client.last_name = client_attr[:last_name]
      address = Address.new
      address = client.address unless client.address.nil?
      address.street = address_attr[:street]
      address.floor = address_attr[:floor]
      address.state = address_attr[:state]
      address.number = address_attr[:number]
      address.city = address_attr[:city]
      address.country_id = address_attr[:country_id]
      address.client_id = client.id
      address.save
      client.address = address
      client.save
    end
      if @user.update_attributes(params[:user])
        sign_in(@user, :bypass => true)
        format.html { redirect_to edit_user_path(@user), notice: 'Se han registrado los cambios en su perfil.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity, notice: 'No se han podido cambiar sus datos.' }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    session[:body]='page-micuenta'
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def offers_company_user
    session[:body]='page-micuenta'
    @user = current_user

    @offers = Offer.where(:branch_id => Branch.where(:company_id => @user.company.id)).page(params[:page]).per(3)
    @actual_offers = Offer.actual.page(params[:page]).per(3)
    @old_offers = Offer.ended.page(params[:page]).per(3)
  end

  def offers_client_user
    session[:body]='page-micuenta'
    @user = current_user
    @offers = current_user.client.offers.page(params[:page]).per(3)
    @actual_offers = current_user.client.offers.where('end_date <= ?', Date.current).page(params[:page]).per(3)
    @old_offers = current_user.client.offers.where('end_date > ?', Date.current).page(params[:page]).per(3)
  end

  def titles_user
    @user = current_user

  end

  def save_titles_user
    @user = current_user
    titles = params[:title_ids]
    unless titles.nil?
      ClientsTitles.where("client_id = ?", @user.client.id).each do |relation|
        relation.destroy
      end
      titles.each do |title_id|
        title = Title.find(title_id)
        @user.client.titles.push(title)
      end
    end
    redirect_to users_titles_user_path
  end

  def branches_company_user
    session[:body]='page-micuenta'
    @user = current_user
    @branches = Branch.where("company_id = ?",@user.company.id).page(params[:page]).per(4)
  end

  def home

  end

  def home_view
    session[:body]='offer-listing-page'
    @user = current_user
    @offers = Array.new
    if @user.user_role_id == 1 #company
      @offers = Offer.where(:branch_id => Branch.select(:id).where(:company_id => @user.company.id)).order("created_at DESC").take(6)
    else
      @offers = Offer.all #aca tenés que agarrar todas las ofertas que no estén finalizadas y que el coincidan los titles con los del current_user
    end
  end

  def home_map
    @user = current_user
    @offers = Array.new
    @longitude = -58.381244
    @latitude = -34.603683
    @json = Address.all.to_gmaps4rails
    address = Address.new
    if @user.user_role_id == 2
      address = @user.client.address
      #Mostrar solo los que interesen
      #@json = Address.where(:branch_id => Branch.select(:id).where(:company_id => @user.company.id)).take(10).to_gmaps4rails
    else if @user.user_role_id == 1
      address = @user.company.branches.first.address
      @json = Address.where(:branch_id => Branch.select(:id).where(:company_id => @user.company.id)).take(10).to_gmaps4rails
    end
    end
    unless address.nil?
      @latitude = address.latitude
      @longitude = address.longitude
    end
  end

  def inscribe
    offer_id = params[:offer_id]
    client_id = Client.where(:user_id => current_user.id).first.id
    clients_offers = ClientsOffer.new
    clients_offers.client_id = client_id
    clients_offers.offer_id = offer_id
    if clients_offers.save
      redirect_to offer_path(Offer.find_by_id(offer_id))
    end
  end

  def unsubscribe
    clients_offers = ClientsOffer.find(params[:clients_offers_id])
    if clients_offers.destroy
      redirect_to offer_path(Offer.find_by_id(params[:offer_id]))
    end
  end

  def change_newsletter_frequency
    session[:body]='page-micuenta'
    if !params[:user].nil?
      current_user.client.newsletter_frequency_id=params[:user][:client_attributes][:newsletter_frequency_id]
      if current_user.client.save
        redirect_to :back, :notice => "Se ha cambiado correctamente la frecuencia del newsletter"
      end
    end

  end

end
