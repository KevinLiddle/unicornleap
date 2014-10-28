class MyRSpec

  def self.v3_rspec(config)
    failures = false

    config.after(:each) do |example|
      if example.exception
        failures = true
      end
    end

    config.after(:suite) do
      MyRSpec.leap(failures)
    end
  end

  def self.v2_rspec(config)
    failures = false

    config.after(:each) do
      if example.exception
        failures = true
      end
    end

    config.after(:suite) do
      MyRSpec.leap(failures)
    end
  end

  def self.leap(failures)
    Thread.new { failures ? `trolleap` : `unicornleap` }
  end

end

RSpec.configure do |config|
  major_version, minor_version, _ =  RSpec::Core::Version::STRING.split(".").map(&:to_i)
  if major_version == 3 || (major_version == 2 && minor_version == 99)
    MyRSpec.v3_rspec(config)
  elsif major_version == 2
    MyRSpec.v2_rspec(config)
  end
end
