class GreetionsController < ApplicationController
  before_action :set_greetion, only: %i[ show edit update destroy ]

  # GET /greetions or /greetions.json
  def index
    @greetions = Greetion.all
  end

  # GET /greetions/1 or /greetions/1.json
  def show
  end

  # GET /greetions/new
  def new
    @greetion = Greetion.new
  end

  # GET /greetions/1/edit
  def edit
  end

  # POST /greetions or /greetions.json
  # createという名前で以下の内容のメソッドを作成
  def create
    # greetionのパラメータを指定してGreetionクラスを新規作成し、変数@greetionに紐つける
    @greetion = Greetion.new(greetion_params)
    # レスポンスを作成し、変数formatに入れて以下の処理を実行する
    respond_to do |format|
      # もしも変数@greetionを保存しろの結果が真なら以下を実行
      if @greetion.save
        # ハッシュ{成功ページの内容}を指定して変数formatのHTMLを生成
        format.html { redirect_to greetion_url(@greetion), notice: "Greetion was successfully created." }
        format.json { render :show, status: :created, location: @greetion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @greetion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /greetions/1 or /greetions/1.json
  def update
    respond_to do |format|
      if @greetion.update(greetion_params)
        format.html { redirect_to greetion_url(@greetion), notice: "Greetion was successfully updated." }
        format.json { render :show, status: :ok, location: @greetion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @greetion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /greetions/1 or /greetions/1.json
  def destroy
    @greetion.destroy

    respond_to do |format|
      format.html { redirect_to greetions_url, notice: "Greetion was successfully destroyed." }
      format.json { head :no_content }
    end
  end
# privateはクラス外部に非公開を意味する
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_greetion
      @greetion = Greetion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def greetion_params
      params.require(:greetion).permit(:name, :message)
    end
end
