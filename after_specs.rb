class MyRSpec

  def self.v3_rspec(config)
    failures = false

    config.after(:each) do |example|
      if example.exception
        failures = true
      end
    end

    config.after(:suite) do
      Thread.new { failures ? `trolleap` : `unicornleap` }
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
  case RSpec::Core::Version::STRING.split(".").first.to_i
  when 2
    MyRSpec.v2_rspec(config)
  when 3
    MyRSpec.v3_rspec(config)
  end
end
