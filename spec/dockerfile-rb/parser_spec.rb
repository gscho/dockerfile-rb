RSpec.describe DockerfileRB do
  it "parses from lines" do
    parsed = DockerfileRB.parse((File.read("#{File.expand_path('fixtures/Dockerfile.from', __dir__)}")))
    expect(parsed).not_to be nil
    expect(parsed['from'].size).to eq(4)
  end

  it "parses add lines" do
    parsed = DockerfileRB.parse((File.read("#{File.expand_path('fixtures/Dockerfile.add', __dir__)}")))
    expect(parsed).not_to be nil
    expect(parsed['add'].size).to eq(3)
    expect(parsed['add'].first.arg).to eq('--chown')
    expect(parsed['add'].first.user).to eq('wheel')
    expect(parsed['add'].first.group).to eq('admin')
    expect(parsed['add'].first.src).to eq('/src')
    expect(parsed['add'].first.dest).to eq('/dest')
    expect(parsed['add'][1].arg).to eq(nil)
    expect(parsed['add'][1].user).to eq(nil)
    expect(parsed['add'][1].group).to eq(nil)
    expect(parsed['add'][1].src).to eq('foo')
    expect(parsed['add'][1].dest).to eq('bar')
    expect(parsed['add'][2].arg).to eq('--chown')
    expect(parsed['add'][2].user).to eq('wheel')
    expect(parsed['add'][2].group).to eq('admin')
    expect(parsed['add'][2].src).to eq('src with whitespace')
    expect(parsed['add'][2].dest).to eq('dest with whitespace')
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

  it "parses copy lines" do
    parsed = DockerfileRB.parse((File.read("#{File.expand_path('fixtures/Dockerfile.copy', __dir__)}")))
    expect(parsed).not_to be nil
    expect(parsed['copy'].size).to eq(3)
    expect(parsed['copy'].first.arg).to eq('--chown')
    expect(parsed['copy'].first.user).to eq('wheel')
    expect(parsed['copy'].first.group).to eq('admin')
    expect(parsed['copy'].first.src).to eq('/src')
    expect(parsed['copy'].first.dest).to eq('/dest')
    expect(parsed['copy'][1].arg).to eq(nil)
    expect(parsed['copy'][1].user).to eq(nil)
    expect(parsed['copy'][1].group).to eq(nil)
    expect(parsed['copy'][1].src).to eq('foo')
    expect(parsed['copy'][1].dest).to eq('bar')
    expect(parsed['copy'][2].arg).to eq('--chown')
    expect(parsed['copy'][2].user).to eq('wheel')
    expect(parsed['copy'][2].group).to eq('admin')
    expect(parsed['copy'][2].src).to eq('src with whitespace')
    expect(parsed['copy'][2].dest).to eq('dest with whitespace')
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

  it "parses env lines" do
    parsed = DockerfileRB.parse((File.read("#{File.expand_path('fixtures/Dockerfile.env', __dir__)}")))
    expect(parsed).not_to be nil
    expect(parsed['env'].size).to eq(3)
    expect(parsed['env'].first.pairs).to eq({"myDog"=>"Rex The Dog"})
    expect(parsed['env'][1].pairs).to eq({"myCat" => "fluffy"})
    expect(parsed['env'][2].pairs).to eq({"myName" => "John Doe", "myDog"=>"Rex\\ The\\ Dog", "myCat" => "fluffy"})
  end

  it "parses expose lines" do
    parsed = DockerfileRB.parse((File.read("#{File.expand_path('fixtures/Dockerfile.expose', __dir__)}")))
    expect(parsed).not_to be nil
    expect(parsed['expose'].size).to eq(3)
    expect(parsed['expose'].first.port).to eq(80)
    expect(parsed['expose'].first.protocol).to eq('tcp')
    expect(parsed['expose'][1].port).to eq(9631)
    expect(parsed['expose'][1].protocol).to eq('udp')
    expect(parsed['expose'][2].port).to eq(8080)
    expect(parsed['expose'][2].protocol).to eq('tcp')
  end

  it "parses label lines" do
    parsed = DockerfileRB.parse((File.read("#{File.expand_path('fixtures/Dockerfile.label', __dir__)}")))
    expect(parsed).not_to be nil
    expect(parsed['label'].size).to eq(4)
    expect(parsed['label'].first.pairs).to eq({"com.example.vendor" => "ACME Incorporated"})
    expect(parsed['label'][1].pairs).to eq({"com.example.label-with-value" => "foo"})
    expect(parsed['label'][2].pairs).to eq({"multi.label1" => "value1", "multi.label2" => "value2", "other" => "value3"})
    expect(parsed['label'][3].pairs).to eq({"multi.label1" => "value1", "multi.label2" => "value2", "other" => "value3"})
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

  it "parses workdir lines" do
    parsed = DockerfileRB.parse((File.read("#{File.expand_path('fixtures/Dockerfile.workdir', __dir__)}")))
    expect(parsed).not_to be nil
    expect(parsed['workdir'].size).to eq(4)
    expect(parsed['workdir'].first.path).to eq('$DIRPATH/$DIRNAME')
    expect(parsed['workdir'][1].path).to eq('/path/to/workdir')
    expect(parsed['workdir'][2].path).to eq('C:\path\to\workdir')
    expect(parsed['workdir'][3].path).to eq('b')
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
    expect(parsed['copy'].size).to eq(3)
    expect(parsed['copy'].first.arg).to eq('--chown')
    expect(parsed['copy'].first.user).to eq('cheese')
    expect(parsed['copy'].first.group).to eq('bagels')
    expect(parsed['copy'].first.src).to eq('my/src')
    expect(parsed['copy'].first.dest).to eq('/my/dest')
    expect(parsed['copy'][1].arg).to eq(nil)
    expect(parsed['copy'][1].user).to eq(nil)
    expect(parsed['copy'][1].group).to eq(nil)
    expect(parsed['copy'][1].src).to eq('dir_one')
    expect(parsed['copy'][1].dest).to eq('dir_two')
    expect(parsed['copy'][2].user).to eq('wheel')
    expect(parsed['copy'][2].group).to eq('admin')
    expect(parsed['copy'][2].src).to eq('src with whitespace')
    expect(parsed['copy'][2].dest).to eq('dest with whitespace')
    expect(parsed['add'].size).to eq(3)
    expect(parsed['add'].first.arg).to eq('--chown')
    expect(parsed['add'].first.user).to eq('cheese')
    expect(parsed['add'].first.group).to eq('bagels')
    expect(parsed['add'].first.src).to eq('my/src')
    expect(parsed['add'].first.dest).to eq('/my/dest')
    expect(parsed['add'][1].arg).to eq(nil)
    expect(parsed['add'][1].user).to eq(nil)
    expect(parsed['add'][1].group).to eq(nil)
    expect(parsed['add'][1].src).to eq('dir_one')
    expect(parsed['add'][1].dest).to eq('dir_two')
    expect(parsed['add'][2].user).to eq('wheel')
    expect(parsed['add'][2].group).to eq('admin')
    expect(parsed['add'][2].src).to eq('src with whitespace')
    expect(parsed['add'][2].dest).to eq('dest with whitespace')
    expect(parsed['label'].size).to eq(4)
    expect(parsed['label'].first.pairs).to eq({"com.example.vendor" => "ACME Incorporated"})
    expect(parsed['label'][1].pairs).to eq({"com.example.label-with-value" => "foo"})
    expect(parsed['label'][2].pairs).to eq({"multi.label1" => "value1", "multi.label2" => "value2", "other" => "value3"})
    expect(parsed['label'][3].pairs).to eq({"multi.label1" => "value1", "multi.label2" => "value2", "other" => "value3"})
    expect(parsed['maintainer'].size).to eq(1)
    expect(parsed['maintainer'].first.name).to eq('greg.c.schofield@gmail.com')
    expect(parsed['user'].size).to eq(1)
    expect(parsed['user'].first.user_id).to eq('0')
    expect(parsed['user'].first.group_id).to eq('0')
    expect(parsed['entrypoint'].size).to eq(1)
    expect(parsed['entrypoint'].first.executable).to eq('top')
    expect(parsed['entrypoint'].first.parameters).to eq(["-b"])
    expect(parsed['expose'].size).to eq(1)
    expect(parsed['expose'].first.port).to eq(3000)
    expect(parsed['expose'].first.protocol).to eq('tcp')
    expect(parsed['workdir'].size).to eq(1)
    expect(parsed['workdir'].first.path).to eq('/path/to/workdir')
    expect(parsed['env'].size).to eq(3)
    expect(parsed['env'].first.pairs).to eq({"myDog"=>"Rex The Dog"})
    expect(parsed['env'][1].pairs).to eq({"myCat" => "fluffy"})
    expect(parsed['env'][2].pairs).to eq({"myName" => "John Doe", "myDog"=>"Rex\\ The\\ Dog", "myCat" => "fluffy"})
  end
end
