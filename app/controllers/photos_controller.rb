class PhotosController < ApplicationController
  before_action :current_user
  before_action :authenticate_user
  def index
    @photos = Photo.all
    render json: @photos.as_json
  end

  def create
    @photo = Photo.new(
      image_url: params[:image_url],
      date: params[:date],
      description: params[:description],
      user_id: current_user.id
    )
    @photo.save
    render json: @photo.as_json
  end

  def show
    @photo = Photo.find_by(id: params[:id])
    render json: @photo.as_json
  end

  def update
    @photo = Photo.find_by(id: params[:id])
    @photo.image_url = params[:image_url] || @photo.image_url
    @photo.date = params[:date] || @photo.date
    @photo.description = params[:description] || @photo.description
    @photo.user_id = params[:user_id] || @photo.user_id
    @photo.save
    render json: @photo.as_json
  end

  def destroy
    photo = Photo.find_by(id: params[:id])
    photo.destroy
    render json: {message: "Photo successfully destroyed."}
  end

end
