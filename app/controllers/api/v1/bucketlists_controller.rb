module Api
  module V1
    class BucketlistsController < ApplicationController
      before_action :doorkeeper_authorize!
      before_action :set_bucketlist, except: [:create, :index]

      def create
        @bucketlist = Bucketlist.new(bucketlist_params)
        set_user_id
        if @bucketlist.save
          render json: @bucketlist
        else
          render json: { error: "Bucketlist not created try again" }
        end
      end

      def index
        @bucketlists = Bucketlist.all
        render json: @bucketlists
      end

      def show
        render json: @bucketlist
      end

      def update
        if @bucketlist.update(bucketlist_params)
          render json: @bucketlist
        else
          render json: { error: "Bucketlist not updated try again" }
        end
      end

      def destroy
        @bucketlist.destroy
        render json: { message: "Bucketlist deleted" }
      end

      private

      def set_bucketlist
        @bucketlist = Bucketlist.find(params[:id])
      end

      def bucketlist_params
        params.require(:bucketlist).permit(:name)
      end

      def set_user_id
        @bucketlist.user_id = session[:user_id]
      end
    end
  end
end
