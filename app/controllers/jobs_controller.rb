class JobsController < ApplicationController

  def index
    @jobs = Job.all
    sort_params
  end

  def new
    @job = Job.new()
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title}"
      redirect_to job_path(@job)
    else
      flash[:error] = "There's a problem with saving the job!"
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @comment = Comment.new
    @comment.job_id = @job.id
  end

  def edit
    @job = Job.find(params[:id])
    @company = @job.company
  end

  def update
    @job = Job.find(params[:id])
    @company = @job.company
    @job.update(job_params)
      if @job.save
        flash[:success] = "#{@job.title} updated!"
        redirect_to company_job_path(@company, @job)
      else
        render :edit
      end
  end

  def destroy
    job = Job.find(params[:id])
    company = job.company
    if job.destroy
      flash[:success] = "#{job.title} was successfully deleted!"
      redirect_to company_jobs_path(company)
    else
      flash[:error] = "Somthing went wrong..."
      render jobs_path(job)
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id, :company_id)
  end

  def sort_params
    if params[:sort] == "location"
      @jobs = Job.order(:city)
    elsif
      params[:sort] == "interest"
      @jobs = Job.order(level_of_interest: :desc)
    end
  end
end
