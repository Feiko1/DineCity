module Owner
  class DealsController < Owner::BaseController
    # before_filter only: [:index, :edit, :new, :update]
    before_action :find_owner, only: [:edit, :update]

    def show
      @deal = Deal.find(params[:id])
    end

    def index
      @restaurants = Restaurant.where(user_id: current_user.id)
    end

    def new
      @deal = Deal.new
    end

    def create
      @deal = Deal.new(deal_params)
      if @deal.save!
        flash[:success] = "Deal was successfully created"
        redirect_to owner_deals_path(@deal)
      else
        render 'new'
    end

    def edit
      @deal = Deal.find(params[:id])
    end

    def update
      if @deal.update(deal_path)
        flash[:success] = "Deal was successfully updated"
        redirect_to owner_deals_path(@deal)
        else
        render 'edit'
        end
      end
    end

    def destroy
      @deal.destroy
      flash[:danger] = "Deal was successfully deleted"
      redirect_to deal_path
    end

    private
    def deal_params
      params.require(:deal).permit(:name, :description, :restaurant_id)
    end

    def find_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def find_owner
      @user = User.find(params[:user_id])
    end
  end
end
