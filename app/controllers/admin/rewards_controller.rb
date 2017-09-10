class Admin::RewardsController < ApplicationController

  before_action :require_admin

  def require_admin
    render file: "/public/404" unless current_admin?
  end

  def new
    @reward = Reward.new
  end

  def create
    @reward = Reward.new(rewards_params)
    if @reward.save
      redirect_to rewards_path
    else
      redirect_to new_admin_reward_path
    end
  end

  def edit
    @reward = Reward.find(params[:id])
  end

  def update
    @reward = Reward.find(params[:id])
    @reward.update(rewards_params)

    redirect_to rewards_path
  end

  def destroy
    @reward = Reward.find(params[:id])
    @reward.destroy
    redirect_to rewards_path
  end

  private

  def rewards_params
    params.require(:reward).permit(:name, :cost)
  end
end