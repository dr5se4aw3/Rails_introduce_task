class TclonesController < ApplicationController
  before_action :find_tclone , only: [:edit, :update, :destroy]
  def index
    @tclones = Tclone.all
  end

  def new
    @tclone = Tclone.new
  end

  def create
    @tclone = Tclone.new(tclone_params)
    if params[:back]
      render :new
    else
      if @tclone.save
        redirect_to tclones_path, notice: "ツイートを追加しました"
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @tclone.update(tclone_params)
      redirect_to tclones_path, notice: "ツイートを編集しました"
    else
      render :edit
    end
  end

  def destroy
    @tclone.destroy
    redirect_to tclones_path, notice: "ツイートを削除しました"
  end

  def confirm
    @tclone = Tclone.new(tclone_params)
    render :new if @tclone.invalid?
  end

  private
  def tclone_params
    params.require(:tclone).permit(:content)
  end

  def find_tclone
    @tclone = Tclone.find(params[:id])
  end

end
