class ArtigosController < ApplicationController
  before_action :set_artigo, only: [:show, :edit, :update, :destroy]

  # GET /artigos
  # GET /artigos.json
  def index
    @artigos = Artigo.all.reverse_order
  end

  # GET /artigos/1
  # GET /artigos/1.json
  def show
  end

  # GET /artigos/new
  def new
    @artigo = Artigo.new
  end

  # GET /artigos/1/edit
  def edit
  end

  # POST /artigos
  # POST /artigos.json
  def create
    @artigo = Artigo.new(artigo_params)
    @artigo.user_id = current_user.id

    respond_to do |format|
      if @artigo.save
        auth = {
          cloud_name: "flampic",
          api_key:    '333169189687311',
          api_secret: "kqXVte1LTbMllETzF9MySTOHUds"
        }
        @cloudUp = Cloudinary::Uploader.upload(@artigo.capa.path, auth)
        @artigo.cloudname = @cloudUp["public_id"]
        @artigo.save
        format.html { redirect_to @artigo, notice: 'Artigo criado com sucesso.' }
        format.json { render :show, status: :created, location: @artigo }
      else
        format.html { render :new }
        format.json { render json: @artigo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artigos/1
  # PATCH/PUT /artigos/1.json
  def update
    respond_to do |format|
      if @artigo.update(artigo_params)
        format.html { redirect_to @artigo, notice: 'Artigo atualizado.' }
        format.json { render :show, status: :ok, location: @artigo }
      else
        format.html { render :edit }
        format.json { render json: @artigo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artigos/1
  # DELETE /artigos/1.json
  def destroy
    @artigo.destroy
    respond_to do |format|
      format.html { redirect_to artigos_url, notice: 'Artigo excluido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artigo
      @artigo = Artigo.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def artigo_params
      params.require(:artigo).permit(:titulo, :texto, :user_id, :capa, :cloudname)
    end
end
