class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])
    @rewards = @user.rewards
    render file: "/public/404" unless current_user.id == @user.id
  end

  def buy
    reward = Reward.find(params[:reward_id])
    if user_can_buy_reward?(reward)
      current_user.rewards << reward
      points_balance = current_user.points - reward.cost
      redeemed_points = current_user.redeemed_points + reward.cost
      current_user.update_attributes(points: points_balance, redeemed_points: redeemed_points)
      redirect_to current_user
    else
      flash[:error] = "You do not have enough points to buy that"
      redirect_to rewards_path
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(points: params[:user][:points])

    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def user_can_buy_reward?(reward)
    user = current_user
    (user.points - reward.cost) >= 0
  end

end