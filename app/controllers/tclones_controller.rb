class TclonesController < ApplicationController
  def index
    @tclones = Tclone.all
  end

  def new
    @tclone = Tclone.new
  end

  def create
    @tclone = Tclone.new(tclone_params)
    if @tclone.save
      redirect_to tclones_path, notice: "ツイートを追加しました"
    else
      render :new
    end
  end

  private
  def tclone_params
    params.require(:tclone).permit(:content)
  end

end
