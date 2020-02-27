class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @offices = Office.all.sample(3)
  end

def dashbaord
  @user = current_user
end

end

