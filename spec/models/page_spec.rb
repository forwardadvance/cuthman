require 'spec_helper'

describe Page do
  before do
    @page = create :page
  end

  describe "metadata" do
    it "exists" do
      expect(@page.metadatum).to be_a(Metadatum)
    end
  end

  describe "tree structure" do

    before do
      @parent = create :page
      @page.parent = @parent
      @child_1 = create :page
      @child_2 = create :page
      @page.children = [@child_1, @child_2]
      @page.save
    end
    it "has a parent" do
      expect(@page.parent).to eq(@parent)
    end
    it "has children" do
      expect(@page.children).to include(@child_1)
      expect(@page.children).to include(@child_2)
    end
    it "has a root" do
      expect(Page.root).to eq(@parent)
    end
    describe "path navigation" do
      it "succeeds" do
        expect(Page.from_path(@page.slug)).to eq(@page)
        expect(Page.from_path([@page.slug, @child_1.slug].join("/"))).to eq(@child_1)
      end
      it "gets the root" do
        expect(Page.from_path("")).to eq(@parent)
      end
      it "fails gracefully" do
        expect(Page.from_path([@page.slug, @child_1, 'fail'].join("/"))).to be_nil
        expect(Page.from_path('fail')).to be_nil
      end
    end
  end
end
