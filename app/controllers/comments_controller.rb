class CommentsController<ApplicationController
before_action :authenticate_user!, only: [:destroy]
before_action :set, only: [:destroy]
before_action :auth, only: [:destroy]
def create
Comment.create(content: params[:comment][:content], post_id:params[:comment][:post_id], user_id:current_user.id)

redirect_to post_path(params[:comment][:post_id])
end
def destroy
@comment.destroy
redirect_to root_path
end
private
def auth
if current_user.id!=@comment.user_id
return redirect_to root_path
end
end
def set
@comment=Comment.find(params[:id])
end
end