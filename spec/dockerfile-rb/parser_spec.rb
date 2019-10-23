RSpec.describe DockerfileRB do
  it "parses from lines" do
    parsed = DockerfileRB.parse((File.read("#{File.expand_path('fixtures/Dockerfile.from', __dir__)}")))
    puts parsed.inspect
    expect(parsed).not_to be nil
    expect(parsed['From'].size).to eq(4)
  end

  # it "parses arg lines" do
  #   expect(DockerfileRB.parse(File.read("#{File.expand_path('fixtures/Dockerfile.arg', __dir__)}"))).not_to be nil
  # end
end
