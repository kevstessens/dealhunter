class OffersController < ApplicationController
  # GET /offers
  # GET /offers.json
  def index
    @offers = Offer.all
    @json = Address.all.to_gmaps4rails
    @latitude = -34.603683
    @longitude = -58.381244
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @offers }
    end
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
    @offer = Offer.find(params[:id])
    @user = current_user

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @offer }
    end
  end

  # GET /offers/new
  # GET /offers/new.json
  def new
    @offer = Offer.new if @offer.nil?
    @user = current_user

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @offer }
    end
  end

  # GET /offers/1/edit
  def edit
    @offer = Offer.find(params[:id])
  end

  # POST /offers
  # POST /offers.json
  def create
    offer = params[:offer]
    @offer = Offer.new
    @offer.name = offer[:name]
    @offer.start_date = offer[:start_date]
    @offer.end_date = offer[:end_date]
    @offer.created_at = Time.now
    @offer.updated_at = Time.now
    @offer.photo = offer[:photo]
    @offer.branch = Branch.find(offer[:branch_id])
    @offer.description = offer[:description]
    @offer.start_date.change({:hour => (offer[:start_hour]).to_i})
    @offer.end_date.change({:hour => (offer[:end_hour]).to_i})

    respond_to do |format|
      if @offer.save
        format.html { redirect_to users_offers_company_user_path , notice: 'offer was successfully created.' }
        format.json { render json: @offer, status: :created, location: @offer }
      else
        format.html { render action: "new" }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /offers/1
  # PUT /offers/1.json
  def update
    @offer = Offer.find(params[:id])

    respond_to do |format|
      if @offer.update_attributes(params[:offer])
        format.html { redirect_to @offer, notice: 'offer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy

    respond_to do |format|
      format.html { redirect_to offers_url }
      format.json { head :no_content }
    end
  end

  def save_titles
    @offer = Offer.new
    titles = params[:title_ids]
    titles.each do |titles_id|
      title=Title.find(titles_id)
      @offer.titles.push(title)
    end

    redirect_to new_offer_path(:offer => @offer)

  end

end

