class CandidatesController < ApplicationController
  # GET /candidates
  # GET /candidates.json
  def index
    @all_perfiles = Candidate.all_perfiles
    @selected_perfiles = params[:perfiles] || session[:perfiles] || {}

        
    if @selected_perfiles != {} 
      if params[:perfiles] != session[:perfiles] and params[:perfiles] != {}
        session[:perfiles] = params[:perfiles]
      elsif session[:perfiles] != {} and params[:perfiles] == {} 
        @selected_perfiles == {}
      end
      @candidates = Candidate.find_all_by_perfil(@selected_perfiles.keys)
    else
      @candidates = Candidate.all
    end

       
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @candidates }
    end
  end

  # GET /candidates/1
  # GET /candidates/1.json
  def show
    @candidate = Candidate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @candidate }
    end
  end

  # GET /candidates/new
  # GET /candidates/new.json
  def new
    @candidate = Candidate.new
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @candidate }
    end
  end

  # GET /candidates/1/edit
  def edit
    @candidate = Candidate.find(params[:id])
  end

  # POST /candidates
  # POST /candidates.json
  def create
    @candidate = Candidate.new(params[:candidate])

    respond_to do |format|
      if @candidate.save
        format.html { redirect_to @candidate, notice: 'Candidate was successfully created.' }
        format.json { render json: @candidate, status: :created, location: @candidate }
      else
        format.html { render action: "new" }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /candidates/1
  # PUT /candidates/1.json
  def update
    @candidate = Candidate.find(params[:id])

    respond_to do |format|
      if @candidate.update_attributes(params[:candidate])
        format.html { redirect_to @candidate, notice: 'Candidate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidates/1
  # DELETE /candidates/1.json
  def destroy
    @candidate = Candidate.find(params[:id])
    @candidate.destroy

    respond_to do |format|
      format.html { redirect_to candidates_url }
      format.json { head :no_content }
    end
  end

  
end
