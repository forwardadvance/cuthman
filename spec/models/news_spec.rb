require 'spec_helper'

describe News do
  before do
    @news = create :news
  end
  it "is valid" do
    expect(@news).to be_valid
  end
end