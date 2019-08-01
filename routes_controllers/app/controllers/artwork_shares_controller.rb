class ArtworkSharesController < ApplicationController
  def index
    artwork_share = ArtworkShare.find_by(artist_id: params[:id])
    render json: artwork_share
  end

  def create
    artwork_share = ArtworkShare.new(artwork_share_params)
    artwork_share.save!
    artwork_share.save ? render json: artwork_share :
    render json: artwork_share.errors.full_messages, status: :unprocessable_entity
  end

  def destroy
    artwork_share = ArtworkShare.find(params[:id])
    artwork_share.destroy
    render json: artwork_share.all
  end

  private
  def artwork_share_params
    params.require(:artwork_share).permit(:artwork_id, :viewer_id)
  end
end