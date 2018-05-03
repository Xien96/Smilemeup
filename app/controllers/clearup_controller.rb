class ClearupController < ApplicationController
  before_action :authenticate_user!
  def candidate
    @active = "products"
  end

  def upload
    user = warden.user
    user.candidate_1 = params[:file1] if params[:file1]
    user.candidate_2 = params[:file2] if params[:file2]
    user.candidate_3 = params[:file3] if params[:file3]
    user.candidate_4 = params[:file4] if params[:file4]
    user.save
   render json: {
      message: "success", id: user.id,
      candidate_1: user.candidate_1.url,
      candidate_2: user.candidate_2.url,
      candidate_3: user.candidate_3.url,
      candidate_4: user.candidate_4.url
    }, :status => 200
  end
end
