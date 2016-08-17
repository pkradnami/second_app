class ProjectsController < ApplicationController
    def index
        #ViewのFormで取得したパラメータをモデルに渡す
        @projects = Project.search(params[:search])
    end
end
