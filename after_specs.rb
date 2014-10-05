RSpec.configure do |config|
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
