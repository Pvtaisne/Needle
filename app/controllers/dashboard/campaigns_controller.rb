class Dashboard::CampaignsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = Campaign.find(params[:id])
    @order = Order.new
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = current_user.campaigns.new(campaign_params)
    @campaign.save

    redirect_to dashboard_campaigns_path(), notice: "Your campaign has been created !"
  end

  def edit
  end

  def update
  end

  # def finished?
  #   if Date.today.to_time - @campaign.date_end < 0
  #     true
  #   else
  #     false
  #   end
  # end

  private

  def campaign_params
     params.require(:campaign).permit(:title, :batch_size, :date_start, :date_end, :description, :spec, :price, :category, :gender, :photo)
  end
end
