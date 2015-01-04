major_version, _, _ =  RSpec::Core::Version::STRING.split(".").map(&:to_i)

module LeapingUnicorns
  def example_failed(notification)
    @failed = true
  end

  def close(notification=nil)
    leap(@failed)
  end

  private

  @failed = false

  def leap(failures)
    fork { failures ? `trolleap` : `unicornleap` }
  end
end

if major_version == 2
  require "rspec/core/formatters/base_formatter"

  class UnicornLeap < RSpec::Core::Formatters::BaseFormatter
    include LeapingUnicorns

    def initialize(output)
      super(output)
    end
  end
else
  class UnicornLeap
    include LeapingUnicorns

    RSpec::Core::Formatters.register self, :example_failed, :close

    def initialize(output)
    end
  end
end

