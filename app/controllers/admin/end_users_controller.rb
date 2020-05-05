class Admin::EndUsersController < ApplicationController
  def index
    @end_users = EndUser.all
  end
end
