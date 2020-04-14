class CubesController < ApplicationController

  def index
    #should show all cubes and times by user
  end

  def show
    #should show times by selected cube by user
  end

  def add_records
    user = User.find_by(id: params[:user_id])
    cube = Cube.find_by(cube_type: params[:cube_type])
    record = params[:record]
    #/users/:user_id/cubes/:cube_id/add_time POST
    #should add times/records for selected cube by user
    byebug
  end

end
