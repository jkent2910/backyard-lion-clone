class VideosController < ApplicationController
  before_action :ensure_byl_admin, only: [:new, :create]
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  def new
    @video = Video.new
  end

  def edit
  end

  def create
    @video = Video.new(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to byl_admin_path, notice: 'Video created.' }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to byl_admin_path, notice: "Video updated" }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end

  def ensure_byl_admin
    unless current_user.byl_admin?
      redirect_to root_path, notice: "You are not allowed to perform that action."
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def video_params
    params.require(:video).permit(:name, :url, :description, :athlete_experience_id)
  end
end