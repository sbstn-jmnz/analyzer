require 'analytics.rb'

describe 'Analytics' do
  describe 'constructor' do
    it "initialize an instance of Analytics" do
      parque_oasis = Analytics.new('smartbots.json')
      expect(parque_oasis).to be_instance_of(Analytics)
    end
  end

  describe 'attributes' do
    before :each do
      @parque_oasis = Analytics.new('smartbots.json')
    end
    it 'allows reading for :chats' do
        expect(@parque_oasis).to respond_to(:chats)
    end

    it "allows iterate through chats" do
      expect(@parque_oasis.chats).to respond_to(:each)
    end
  end
end
