class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  def show
  end

  # GET /answers/new
  def new
    question= Question.find(params[:question_id])
    unless current_user.id == question.user_id
      @answer = Answer.new
    else
      redirect_to question, alert: "You can't answer your own question"
    end
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  def create
    @answer = Answer.new(answer_params)

    if @answer.save
      redirect_to @answer, notice: 'Answer was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /answers/1
  def update
    if @answer.update(answer_params)
      redirect_to @answer, notice: 'Answer was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /answers/1
  def destroy
    @answer.destroy
    redirect_to answers_url, notice: 'Answer was successfully destroyed.'
  end

  #POST /answers/1/makecomment
  def makecomment

  end

  #PUT /answers/1/like
  def like

  end

  #PUT /answers/1/like
  def unlike
    
  end

 #PUT /answers/1/validate
  def validate
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def answer_params
      params[:answer]
    end
end
