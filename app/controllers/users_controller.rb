class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save # 保存の成功をここで扱う。
      flash[:success] = "Welcome to the Sample App!" #成功メッセージ表示
      redirect_to @user #ユーザー登録に成功した場合はページを描画せずに別のページにリダイレクト (Redirect) する
    else
      render 'new' #失敗したらnewに飛ぶ
    end
  end
    private #外部から使えないようにします
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
    end
  

end
