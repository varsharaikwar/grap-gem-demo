module PostCreate
  module V2
      class Posts < Grape::API
        helpers AuthenticationHelper
         before { authorize_request }
          # before { authenticate! }
        format :json
      resource :posts do
        # get '/posts/:id' do
          params do
            requires :title
            requires :description
          end
          desc 'create posts of user'
          post do
            if @current_user.present?
              post = @current_user.posts.create!(declared(params))  
              post 
            else
              "unauthorized"
            end
          end
#####index method for post #####
            get do
              Post.all
            end
########show method########
            get ':id' do
              posts = Post.find(params[:id])
              { post: posts }
              posts
            end
########delete method#########
        delete ':id' do
          @post = Post.find(params[:id])
          @post.destroy
          "delete"
        end
########update method########
params do
  requires :id, type: String, desc: 'Status ID.'
  requires :title, type: String, desc: 'Your title.'
  requires :description, type: String, desc: 'Your description.'
end
put ':id' do
  @post = Post.find(params[:id])

  if @post.update!(declared(params))
    @post
  else
    "unprocessable_entity"
  end
    end 
    end
  end
end
end


  















 