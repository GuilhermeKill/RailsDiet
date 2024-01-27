class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :create

    def create
        meals_params = params.require(:meal).permit(:name, :description, :in_the_diet)
        meal = User.new(user_params)

        if user.save
            render json:{ message: 'Usuário criado com sucesso'}
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
          end
    end


    def update
        user_params = params.require(:user).permit(:name, :password)
        user = User.find(params[:id])

        if user.update(user_params)
            render json:{ message: 'Usuário atualizado com sucesso'}
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end


    def show
        user = User.find(params[:id])

        render json: { user: user}
    end


    def index
        users = User.all

        render json: { users: users }
    end


end
