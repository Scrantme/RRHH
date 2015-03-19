class BusquedasController < ApplicationController
  # GET /busquedas
  # GET /busquedas.json
  def index
    @busquedas = Busqueda.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @busquedas }
    end
  end

  # GET /busquedas/1
  # GET /busquedas/1.json
  def show
    @busqueda = Busqueda.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @busqueda }
    end
  end

  # GET /busquedas/new
  # GET /busquedas/new.json
  def new
    @busqueda = Busqueda.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @busqueda }
    end
  end

  # GET /busquedas/1/edit
  def edit
    @busqueda = Busqueda.find(params[:id])
  end

  # POST /busquedas
  # POST /busquedas.json
  def create
    @busqueda = Busqueda.new(params[:busqueda])

    respond_to do |format|
      if @busqueda.save
        format.html { redirect_to @busqueda, notice: 'Busqueda was successfully created.' }
        format.json { render json: @busqueda, status: :created, location: @busqueda }
      else
        format.html { render action: "new" }
        format.json { render json: @busqueda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /busquedas/1
  # PUT /busquedas/1.json
  def update
    @busqueda = Busqueda.find(params[:id])

    respond_to do |format|
      if @busqueda.update_attributes(params[:busqueda])
        format.html { redirect_to @busqueda, notice: 'Busqueda was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @busqueda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /busquedas/1
  # DELETE /busquedas/1.json
  def destroy
    @busqueda = Busqueda.find(params[:id])
    @busqueda.destroy

    respond_to do |format|
      format.html { redirect_to busquedas_url }
      format.json { head :no_content }
    end
  end
end
