class BugsController < ApplicationController
  before_action :set_bug, only: [:show, :edit, :update, :destroy]

  def initialize   
    super
    @notifier = Slack::Notifier.new "https://hooks.slack.com/services/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" do
    defaults channel: "#desafio-dev-juan",
              username: "notifier"
    end
  end

  # GET /bugs
  # GET /bugs.json
  def index
    @bugs = Bug.where(project_id: params[:project_id])
    @project = params[:project_id]
  end

  # GET /bugs/1
  # GET /bugs/1.json
  def show
  end

  # GET /bugs/new
  def new
    @bug = Bug.new
    @project = Project.find(params[:project_id])
  end

  # GET /bugs/1/edit
  def edit
  end

  # POST /bugs
  # POST /bugs.json
  def create
    @bug = Bug.new(bug_params)
    @project = Project.find(params[:project_id])
    @bug.project_id = @project.id

    respond_to do |format|
      if @bug.save
        # Notificar a criação no Slack
        message = "#{current_user.username} adicionou o bug \"#{@bug.title}\" ao projeto \"#{@project.name}\""
        @notifier.ping message

        format.html { redirect_to user_project_url(current_user.id, params[:project_id]), notice: 'Bug was successfully created.' }
        format.json { render :show, status: :created, location: @bug }
      else
        format.html { render :new }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bugs/1
  # PATCH/PUT /bugs/1.json
  def update
    @bug = Bug.find(params[:id])
    @project = Project.find(params[:project_id])
    
    old_status = @bug.is_fixed

    respond_to do |format|
      if @bug.update(bug_params)
        # Checar se o status do bug mudou
        if @bug.is_fixed != old_status
          status = { true => "Corrigido", false => "Não corrigido"}
          # Caso tenha mudado, notificar no Slack
          message = "#{current_user.username} alterou o status do bug \"#{@bug.title}\" (#{@project.name}) para #{status[@bug.is_fixed]}"
          @notifier.ping message
        end

        format.html { redirect_to user_project_path(current_user.id, params[:project_id]), notice: 'Bug was successfully updated.' }
        format.json { render :show, status: :ok, location: @bug }
      else
        format.html { render :edit }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bugs/1
  # DELETE /bugs/1.json
  def destroy
    @bug.destroy
    respond_to do |format|
      format.html { redirect_to user_project_bugs_url, notice: 'Bug was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bug
      @bug = Bug.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bug_params
      params.require(:bug).permit(:title, :description, :is_fixed, :project_id)
    end
end
