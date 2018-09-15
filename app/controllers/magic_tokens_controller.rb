# frozen_string_literal: true

class MagicTokensController < ApplicationController
  # skip_before_action :require_login, except: [:new]

  # show email form
  def new; end

  # receive email from form submit
  def create
    @user = User.find_or_create_by!(user_params)
    @user.deliver_magic_login_instructions!
    redirect_to(root_path, notice: 'Instructions have been sent to your email.')
  end

  # verify token when user come from email link
  def verify
    @token = params[:token]
    @user = User.load_from_magic_login_token(params[:token])

    if @user.blank?
      not_authenticated
      return
    else
      auto_login(@user)
      @user.clear_magic_login_token!
      redirect_to(root_path, notice: 'Logged in successfully')
    end
  end

  # destroy user session
  def destroy
    logout
    redirect_to(root_path, notice: 'Logged out!')
  end

  private

  def user_params
    params.permit(:email, :name)
  end
end
