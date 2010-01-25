# -*- coding: utf-8 -*-
class AdminController < ApplicationController
  def login
      if request.post?
          user = User.authenticate(params[:name], params[:password])
          if user
              session[:user_id] = user.id
              redirect_to(:action => 'index')
          else
              flash.now[:notice] = "無効なユーザ/パスワードの組み合わせです"
          end
      end
  end

  def logout
  end

  def index
  end

end
