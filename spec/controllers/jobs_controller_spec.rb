require 'spec_helper'

describe JobsController do

  before(:each) do
    @job = create :job
    @user = @job.user
  end

  context "user not logged in" do

    it 'GET index' do
      get :index
      response.should be_success
    end

    it 'GET show' do
      get :index
      response.should be_success
    end

    it 'GET new' do
      get :new
      response.should redirect_to root_url
    end

    it 'GET edit' do
      get :edit, id: @job.id
      response.should redirect_to root_url
    end

    it 'POST create' do
      post :create
      response.should redirect_to root_url
    end

    it 'PUT update' do
      put :update, id: @job.id
      response.should redirect_to root_url
    end 

    it 'DELETE destroy' do
      delete :destroy, id: @job.id
      response.should redirect_to root_url
      @job.reload.should be_persisted
    end

  end

  context "user logged in" do

    login_user

    it 'GET index' do
      get :index
      response.should be_success
    end

    it 'GET show' do
      get :index
      response.should be_success
    end

    it 'GET new' do
      get :new
      response.should be_success
    end

    it 'GET edit should be possible if user is the owner of the job' do
      @job.user = subject.current_user
      @job.save
      get :edit, id: @job.id
      response.should be_success
    end


    it 'GET edit should not be possible if user isnt the owner of the job' do
      get :edit, id: @job.id
      response.should redirect_to @job
    end


    it 'POST create' do
      post :create
      response.should be_success
    end

    it 'PUT update should not be possible if user isnt the owner of the job' do
      put :update, id: @job.id
      response.should redirect_to @job
    end 

    it 'PUT update should be possible if user is the owner of the job' do
      @job.user = subject.current_user
      @job.save
      put :update, id: @job.id, job: {title: "new_title"}
      response.should redirect_to @job
      @job.reload.title.should == "new_title"
    end

    it 'DELETE destroy should not destroy object if user isnt the owner of the job' do
      delete :destroy, id: @job.id
      response.should redirect_to @job
      @job.reload.should be_persisted
    end

    it 'DELETE destroy should destroy object if user is the owner of the job' do
      @job.user = subject.current_user
      @job.save
      delete :destroy, id: @job.id
      response.should redirect_to jobs_url
      lambda do @job.reload end.should raise_error ActiveRecord::RecordNotFound
    end



  end
end
