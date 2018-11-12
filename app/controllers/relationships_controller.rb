class RelationshipsController < ApplicationController
  #ユーザーをフォローする
  def create
    @user=User.find_by(id:params[:id])
    current_user.follow!(@user)
      if(current_user.follow?(@user))
        respond_to do |format|
          format.json
        end
      else
        render nothing: true,status: 404
      end
  end
  #ユーザーのフォローを解除
  def destroy
    @user=User.find_by(id:params[:id])
    current_user.unfollow!(@user)
      if(!current_user.follow?(@user))
        respond_to do |format|
          format.json
        end
      else
        render nothing: true,status: 404
      end
  end
end
