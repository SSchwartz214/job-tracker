class CommentsController < ApplicationController

  def create
    # @company = Company.find(params[:company_id])
    @comment = Comment.new(comment_params)
    @comment.job_id = params[:job_id]

    @comment.save

    redirect_to job_path(@comment.job)
  end

  private

    def comment_params
      params.require(:comment).permit(:author_name, :body)
    end
end
