RSpec.describe DockerfileRB do
  it "parses from lines" do
    parsed = DockerfileRB.parse((File.read("#{File.expand_path('fixtures/Dockerfile.from', __dir__)}")))
    expect(parsed).not_to be nil
    expect(parsed['from'].size).to eq(4)
  end

  it "parses arg lines" do
    parsed = DockerfileRB.parse((File.read("#{File.expand_path('fixtures/Dockerfile.arg', __dir__)}")))
    expect(parsed).not_to be nil
    expect(parsed['arg'].size).to eq(1)
    expect(parsed['arg'].first.name).to eq('TEST_ARG')
    expect(parsed['arg'].first.default_value).to eq('0.82.0')
  end

  it "parses cmd lines" do
    parsed = DockerfileRB.parse((File.read("#{File.expand_path('fixtures/Dockerfile.cmd', __dir__)}")))
    expect(parsed).not_to be nil
    expect(parsed['cmd'].size).to eq(2)
    expect(parsed['cmd'].first.executable).to eq('executable')
    expect(parsed['cmd'].first.parameters).to eq(["param1","param2"])
    expect(parsed['cmd'][1].executable).to eq('command')
    expect(parsed['cmd'][1].parameters).to eq(["param1","param2"])
  end

  it "parses everything at once" do
    parsed = DockerfileRB.parse((File.read("#{File.expand_path('fixtures/Dockerfile', __dir__)}")))
    expect(parsed).not_to be nil
    expect(parsed['from'].size).to eq(1)
    expect(parsed['from'].first.image).to eq('opensuse/leap')
    expect(parsed['from'].first.image_tag).to eq('15.0')
    expect(parsed['from'].first.name).to eq('test')
    expect(parsed['from'].first.image_digest).to eq(nil)
    expect(parsed['arg'].size).to eq(1)
    expect(parsed['arg'].first.name).to eq('TEST_ARG')
    expect(parsed['arg'].first.default_value).to eq('0.82.0')
    expect(parsed['cmd'].size).to eq(2)
    expect(parsed['cmd'].first.executable).to eq('executable')
    expect(parsed['cmd'].first.parameters).to eq(["param1","param2"])
    expect(parsed['cmd'][1].executable).to eq('command')
    expect(parsed['cmd'][1].parameters).to eq(["param1","param2"])
  end
end
