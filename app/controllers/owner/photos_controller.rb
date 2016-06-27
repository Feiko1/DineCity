module Owner
  class PhotosController < Owner::BaseController
    # before_filter only: [:index, :edit, :new, :update]
    # before_action :find_restaurant, only: [:create]

    def create
      @photo = Photo.new(photo_params)
      @restaurant = Restaurant.find(params[:restaurant_id])

      if @photo.save!
        flash[:success] = "Photo successfully uploaded"
        redirect_to edit_owner_restaurant_path(@restaurant)
      else
        render 'new'
      end
    end

    private
    def photo_params
      params.require(:photo).permit(:photo, :photo_cache)
    end

    def find_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

  end
end

