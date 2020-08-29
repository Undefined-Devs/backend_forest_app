class HomeController < ApplicationController
  def index
    @test = t('user.name')
  end
end
