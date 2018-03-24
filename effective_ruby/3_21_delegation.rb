require('forwardable')
require('pry')

class RaisingHash
  extend(Forwardable)
  include(Enumerable)
  def_delegators(:@hash, :[], :[]=, :delete, :each,
                :keys, :values, :length,
                :empty?, :has_key?)
  def_delegator(:@hash, :delete, :erase!)

  def initialize
    p "initialize"
    @hash = Hash.new do |hash, key|
      raise(KeyError, "invalid key '#{key}'!")
    end
  end

  def invert
    other = self.class.new
    other.replace!(@hash.invert)
    other
  end

  def freeze
    # @hash をフリーズした上で、本体もフリーズする
    @hash.freeze
    super
  end

  protected
  def replace!(hash)
    hash.default_proc = @hash.default_proc
    @hash = hash
  end

  private
  # こいつは新しいオブジェクトが作られた直後に呼び出される
  # これがないと、deep copy にならない
  def initialize_copy(other)
    p "initialize_copy"
    @hash = @hash.dup
  end

end

hash = RaisingHash.new
binding.pry
p "hoge"
