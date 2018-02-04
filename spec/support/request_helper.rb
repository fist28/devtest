module RequestHelper
  def json
    JSON.parse(response.body)
  end

  def fixture(file_name)
    JSON.parse(file_fixture("#{file_name}.json").read)
  end
end
