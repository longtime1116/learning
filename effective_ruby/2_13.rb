class Version
  include (Comparable)
  attr_reader(:major, :minor, :patch)
  alias_method(:eql?, :==)

  def initialize(version)
    @major, @minor, @patch = version.split(".").map(&:to_i)
  end

  def <=>(other)
    return nil unless other.is_a?(Version)
    [
      major <=> other.major,
      minor <=> other.minor,
      patch <=> other.patch
    ].detect { |n| !n.zero? } || 0
  end

  def hash
    [major, minor, patch].hash
  end
end

vs = %w(1.0.0  2.0.0 1.0.8 1.11.1 1.9.0).map { |v| Version.new(v) }
p vs.sort

ver1 = Version.new("1.2.3")
ver2 = Version.new("2.3.4")
ver3 = Version.new("2.3.4")
ver4 = Version.new("3.4.5")
p ver1 > ver2
p ver2 == ver3
p ver3 < ver4
