class LexiquesController < ApplicationController
  before_action :set_lexique, only: [:show, :edit, :update, :destroy]

  # GET /lexiques
  # GET /lexiques.json
  def index
    @lexiques = Lexique.paginate(:per_page => 20, :page => params[:page], :order => "mot asc")
  end

  # GET /lexiques/1
  # GET /lexiques/1.json
  def show
  end

  # GET /lexiques/new
  def new
    @lexique = Lexique.new
  end

  # GET /lexiques/1/edit
  def edit
  end

  # POST /lexiques
  # POST /lexiques.json
  def create
    @lexique = Lexique.new(lexique_params)

    respond_to do |format|
      if @lexique.save
        format.html { redirect_to @lexique, notice: 'Lexique was successfully created.' }
        format.json { render action: 'show', status: :created, location: @lexique }
      else
        format.html { render action: 'new' }
        format.json { render json: @lexique.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lexiques/1
  # PATCH/PUT /lexiques/1.json
  def update
    respond_to do |format|
      if @lexique.update(lexique_params)
        format.html { redirect_to @lexique, notice: 'Lexique was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @lexique.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lexiques/1
  # DELETE /lexiques/1.json
  def destroy
    @lexique.destroy
    respond_to do |format|
      format.html { redirect_to lexiques_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lexique
      @lexique = Lexique.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lexique_params
      params.require(:lexique).permit(:id,:mot,:nbr_lettre)
    end
end
