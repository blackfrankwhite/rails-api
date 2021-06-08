class TodoController < ApplicationController
    # add
    def create        
        puts params[:title]
        puts params[:desc]
        @todo = Todo.create(title:params[:title],desc:params[:desc],user_id:@user.id)
        if @user.valid?
            render json: {message: "success"}
        else
            render json: {message: "error"}
        end
    end
end
