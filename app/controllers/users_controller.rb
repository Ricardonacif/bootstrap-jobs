class UsersController < ApplicationController

  def signout
    sign_out :user
    redirect_to root_path, notice: "Deslogado com sucesso!"
  end

end
