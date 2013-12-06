require "spec_helper"
require "lorem_ipsum_word_source"

describe LoremIpsumWordSource do
  subject(:src) {
    LoremIpsumWordSource.new(
      :word_source_path => expand_path("../../support/lorem_ipsum.txt"),
    )
  }

  it "returns the next word from the source" do
    expect(src.next_word).to eq "lorem"
    expect(src.next_word).to eq "ipsum"
    expect(src.next_word).to eq "ipsum"
  end

  describe "counter statics" do
    before do
      src.next_word
      src.next_word
      src.next_word
    end

    it "returns the top five words" do
      expect(src.top_5_words).to eq ["ipsum","lorem",nil,nil,nil]
    end

    it "returns the top five words" do
      expect(src.top_5_consonants).to eq ["m","s","p","r","l"]
    end

    it "retuns total words seen" do
      expect(src.count).to eq 3
    end
  end

  describe "callback" do
    let(:callback) { double(:callback, :run => nil) }
    subject(:src)  {
      LoremIpsumWordSource.new(
        :word_source_path => expand_path("../../support/lorem_callback.txt"),
        :callback         => callback,
      )
    }

    it "calls to callback when find 'semper' word" do
      src.next_word
      src.next_word
      src.next_word
      expect(callback).to have_received(:run).twice
    end
  end

  private

  def expand_path(path)
    File.expand_path(path, __FILE__)
  end
end
