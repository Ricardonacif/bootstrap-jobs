require 'spec_helper'

describe Jobs do
  before(:each) do
    @job = create :job
    @user = @job.user
  end


  [:company_name, :contact_email, :description, :title, :website].each do |field|
    it "should not create a job without #{field.to_s}" do
      lambda do
        create(:job, field => nil)
      end.should raise_error ActiveRecord::RecordInvalid
    end
  end


  it "should validate the association" do
    @job.user.should === @user
    @user.jobs[0].should == @job
  end
end
