class ArtworksController < ApplicationController

    def index
        #debugger
        id = params[:user_id]
        #artworks = Artwork.all.where(artist_id: id).(User.find(id).shared_artworks) 
        artwork = Artwork
          .joins(:artist, :shared_viewers)
          .where('shared_viewers_artworks.id = :id OR  artist_id = :id', {id: id})
          #.where(artist_id: id)
        render json: artwork
        #render json: {:art => artworks, :views => shared_artworks}
    end

    def show
        artwork = Artwork.find(params[:id])
        render json: artwork
    end

    def update
        artwork = Artwork.find(params[:id])
        if artwork.update(artwork_params)
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def create
        artwork = Artwork.create(artwork_params)
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        artwork = Artwork.find(params[:id])
        artwork.destroy
        render json: artwork
    end


    private

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end


end
