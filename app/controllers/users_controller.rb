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
end
