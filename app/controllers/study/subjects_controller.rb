class Study::SubjectsController < ApplicationController
  load_and_authorize_resource

  def index ; end

  def new ; end

  def show ; end

  def update ; end

  def create
    if @subject.save
      redirect_to study_subject_path(@subject), notice: 'Успешно создана.'
    else
      redirect_to new_study_subject_path
    end
  end

  def resource_params
    params.fetch(:study_subject, {}).permit(:user_id, :year, :semester, :group_id,
                                            :title, :kind)
  end
end