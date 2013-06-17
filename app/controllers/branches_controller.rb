class BranchesController < InheritedResources::Base

  def create
    @branch = Company.new(params[:branch])
    @branch.company_id = current_user.company.id

    respond_to do |format|
      if @branch.save
        format.html { redirect_to users_branches_company_user_path, notice: 'Branch was successfully created.' }
        format.json { render json: @branch, status: :created, location: @branch }
      else
        format.html { render action: "new" }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

end
