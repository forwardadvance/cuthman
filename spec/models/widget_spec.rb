require 'spec_helper'

describe Widget do
  describe "news widget"
  before do
    @news = create :news
    @widget = create :widget
    @widget.resource = @news
  end

  it "has a resource" do
    expect(@widget.resource).to eq(@news)
  end

  it "can set a resource" do
    @new_news = create :news
    @widget.resource = @new_news
    expect(@widget.resource).to eq(@new_news)
  end

end
