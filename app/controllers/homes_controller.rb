class HomesController < ApplicationController
  def top
    @groups = Group.order(created_at: :desc).limit(4)
  end
end
