require 'json'
class Analytics
  attr_reader :chats
  def initialize(json_file)
    @chats = JSON.parse(read_file(json_file))
  end

  def created_at

  end

  private
  def read_file(file_path)
    file = File.read(file_path)
  end
end
