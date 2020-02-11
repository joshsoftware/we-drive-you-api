class V1::CabsController < V1::BaseController

    def index
        @cab_data = Cab.all
        render json: {data: @cab_data}
    end

    def create
        @cab = Cab.create(permit_params)
        render json: @cab
    end

    def update
        cab = Cab.find(params[:id])
        cab.update_attributes(permit_params)
        render json: cab
    end

    def destroy
        Cab.destroy(params[:id])
    end

    def show
        cab = Cab.find(params[:id])
        render json: cab
    end

    private
    def permit_params
        params[:cab].permit(:vehicle_number, :capacity)
    end

end
