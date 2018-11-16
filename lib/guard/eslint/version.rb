# A workaround for declaring `class RuboCop`
# before `class RuboCop < Guard` in rubocop.rb
module GuardEslintVersion
  # http://semver.org/
  MAJOR = 0
  MINOR = 1
  PATCH = 0

  def self.to_s
    [MAJOR, MINOR, PATCH].join('.')
  end
end
