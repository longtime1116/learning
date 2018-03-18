module Cluster
  class Array
    attr_reader :disks
    def initialize(n)
      @disks = Array.new(n) { |i| "disk#{i}" }
    end
  end
end

# p Cluster::Array.new(3).disks  # エラーになる。

module Cluster2
  class Array
    attr_reader :disk1, :disk2
    def initialize(n)
      @disk1 = Object::Array.new(n) { |i| "disk#{i}" }
      @disk2 = Object::Array.new(n) { |i| "disk#{i}" }
    end
  end
end
p Cluster2::Array.new(3).disk1
p Cluster2::Array.new(3).disk2

# NOTE: ディレクトリ構成を名前空間にあわせるべし
