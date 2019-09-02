require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the MediaHelper. For example:
#
# describe MediaHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe MediaHelper, type: :helper do
  context '#media_types_collection' do
    it 'returns a collection of titleized media options' do
      expect(media_types_collection).to eq [["Movie", "movie"],
                                            ["Book", "book"],
                                            ["Show", "show"],
                                            ["Podcast", "podcast"],
                                            ["Music", "music"]]
    end
  end
end
