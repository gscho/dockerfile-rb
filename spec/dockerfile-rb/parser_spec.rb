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

  it "parses entrypoint lines" do
    parsed = DockerfileRB.parse((File.read("#{File.expand_path('fixtures/Dockerfile.entrypoint', __dir__)}")))
    expect(parsed).not_to be nil
    expect(parsed['entrypoint'].size).to eq(2)
    expect(parsed['entrypoint'].first.executable).to eq('executable')
    expect(parsed['entrypoint'].first.parameters).to eq(["param1","param2"])
    expect(parsed['entrypoint'][1].executable).to eq('command')
    expect(parsed['entrypoint'][1].parameters).to eq(["param1","param2"])
  end

  it "parses maintainer lines" do
    parsed = DockerfileRB.parse((File.read("#{File.expand_path('fixtures/Dockerfile.maintainer', __dir__)}")))
    expect(parsed).not_to be nil
    expect(parsed['maintainer'].size).to eq(1)
    expect(parsed['maintainer'].first.name).to eq('greg.c.schofield@gmail.com')
  end

  it "parses user lines" do
    parsed = DockerfileRB.parse((File.read("#{File.expand_path('fixtures/Dockerfile.user', __dir__)}")))
    expect(parsed).not_to be nil
    expect(parsed['user'].size).to eq(2)
    expect(parsed['user'].first.user_id).to eq('0')
    expect(parsed['user'].first.group_id).to eq('1000')
    expect(parsed['user'][1].user_id).to eq('wheel')
    expect(parsed['user'][1].group_id).to eq('admin')
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
    expect(parsed['cmd'].size).to eq(3)
    expect(parsed['cmd'].first.executable).to eq('executable')
    expect(parsed['cmd'].first.parameters).to eq(["param1","param2"])
    expect(parsed['cmd'][1].executable).to eq('command')
    expect(parsed['cmd'][1].parameters).to eq(["param1","param2"])
    expect(parsed['cmd'][2].executable).to eq('-c')
    expect(parsed['maintainer'].size).to eq(1)
    expect(parsed['maintainer'].first.name).to eq('greg.c.schofield@gmail.com')
    expect(parsed['user'].size).to eq(1)
    expect(parsed['user'].first.user_id).to eq('0')
    expect(parsed['user'].first.group_id).to eq('0')
    expect(parsed['entrypoint'].size).to eq(1)
    expect(parsed['entrypoint'].first.executable).to eq('top')
    expect(parsed['entrypoint'].first.parameters).to eq(["-b"])
  end
end
