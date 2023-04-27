class UrllsController < ApplicationController
  before_action :set_urll, only: %i[ show edit update destroy ]

  # GET /urlls or /urlls.json
  def index
    @urlls = Urll.all
  end

  # GET /urlls/new
  def new
    @urll = Urll.new
  end

  # GET /urlls/1/edit
  def edit
  end


  def create
    @urll = Urll.new(urll_params)
    @urll.short_url =@urll.generate_short_url
    @urll.long_url = @urll.sanitize
    if @urll.save
      redirect_to urlls_path
    else
      flash[:error] = @urll.errors.full_messages
      redirect_to new_urll_path
    end
  end
  def show
    @urll = Urll.find_by(short_url: params[:short_url])
    redirect_to @urll.sanitize
  end

  # PATCH/PUT /urlls/1 or /urlls/1.json
  def update
    respond_to do |format|
      if @urll.update(urll_params)
        format.html { redirect_to urll_url(@urll), notice: "Urll was successfully updated." }
        format.json { render :show, status: :ok, location: @urll }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @urll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /urlls/1 or /urlls/1.json
  def destroy
    @urll.destroy

    respond_to do |format|
      format.html { redirect_to urlls_url, notice: "Urll was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  def redirect
    @urll = Urll.find_by(short_url: params[:short_url])
    redirect_to @urll.long_url, allow_other_host: true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_urll
      @urll = Urll.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def urll_params
      params.require(:urll).permit(:long_url, :short_url)
    end
end
