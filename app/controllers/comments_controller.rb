class CommentsController < ApplicationController
  before_action :only_users

  before_action only: [:edit, :update] do
    correct_user(find_comment)
  end

  before_action only: [:destroy] do 
    auth_check(find_comment)
  end
  
  before_action :set_comment, only: [:show, :edit, 
                                     :update, :destroy]


  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = current_user.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        notice_message = 'Comment was successfully created.'
      else
        notice_message = 'Failed to create comment.'
      end
      format.html { redirect_to @comment.post, notice: notice_message }
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment.post, notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit, notice: "Failed to update comment." }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_comment
      Comment.find(params[:id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:content, :post_id)
    end
end
