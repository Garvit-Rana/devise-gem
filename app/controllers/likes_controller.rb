class LikesController<ApplicationController
before_action :set, only: [:like]
before_action :authenticate_user!, only: [:like, :destroy]
before_action :auth, only: [:like]
def like
	if @like!=nil
    #@like.count+=1   
    Like.create(post_id: params[:post_id],user_id: current_user.id,count: @like.count+1)
   return redirect_to post_path(params[:post_id])


end
	
	Like.create(post_id:params[:post_id],user_id:current_user.id,count:1)


	
	redirect_to post_path(params[:post_id])

	end
def destroy
	@like=Like.find_by(post_id:params[:post_id])
if @like!=nil
a=Like.find_by(post_id:params[:post_id],user_id:current_user.id)
if a!=nil
a.destroy
end
end
redirect_to request.referrer
end
private
def set
	@like=Like.find_by(post_id:params[:post_id])
	end
def auth
a=Like.find_by(post_id:params[:post_id],user_id:current_user.id)
if a!=nil
redirect_to post_path(params[:post_id])
end
end
end

