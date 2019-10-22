RSpec.describe DockerfileRB do
  it "has a parser" do
    expect(DockerfileRB.parse(File.read("#{File.expand_path('fixtures/Dockerfile', __dir__)}"))).not_to be nil
  end
end
