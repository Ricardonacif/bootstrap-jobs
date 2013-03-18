#encoding: UTF-8
class JobsController < ApplicationController
  # GET /jobs
  # GET /jobs.json

  before_filter :authenticate_user!, except: [:index, :show]


  def index
    @filled = params[:filled].present?
    @jobs = @filled ? Job.not_filled.page(params[:page]).per(10) : Job.already_filled.page(params[:page]).per(10)


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jobs }
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @job = Job.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job }
    end
  end

  # GET /jobs/new
  # GET /jobs/new.json
  def new
    @job = Job.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @job }
    end
  end

  # GET /jobs/1/edit
  def edit
    @job = Job.find(params[:id])
    redirect_to(@job, alert: 'Você não pode editar vagas de outras pessoas!.') if @job.user.id != current_user.id
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(params[:job])
    @job.user = current_user
    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Vaga criada com sucesso.' }
        format.json { render json: @job, status: :created, location: @job }
      else
        format.html { render action: "new" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /jobs/1
  # PUT /jobs/1.json
  def update
    @job = Job.find(params[:id])
    respond_to do |format|

      if @job.user.id != current_user.id 
        format.html { redirect_to(@job, alert: 'Você não pode editar vagas de outras pessoas!.') }
      elsif @job.update_attributes(params[:job])
        format.html { redirect_to @job, notice: 'Vaga atualizada com sucesso.' }        
      else
        format.html { render action: "edit" }
      end

    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job = Job.find(params[:id])

    respond_to do |format|
      if @job.user.id == current_user.id
        @job.destroy
        format.html { redirect_to jobs_url }
      else
        format.html { redirect_to @job, alert: 'Você não pode excluir vagas de outras pessoas!.' }
      end
    end
  end
end
