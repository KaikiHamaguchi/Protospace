require 'rails_helper'
describe Thumbnail do
  it "has the wrong content format" do
    #thumnailが正常に動作するか。
    thumbnail = build(:thumbnail)
    expect(thumbnail).to be_valid
  end

  it "has the wrong content format" do
    #image_urlがnilなら通らない。
    thumbnail = build(:thumbnail, image_url: nil)
    expect(thumbnail).to be_valid
  end
end
