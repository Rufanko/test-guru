class Admin::BadgesController < Admin::BaseController

  before_action :find_badge,  only: %i[edit update show destroy]

  def index
    @badges = Badge.all
  end

  def show; end

  def new
    @badge = Badge.new
  end

  def create
    if Badge.create(badge_params)
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def destroy
    @badge.destroy
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :rule, :image_url)
  end

end
