# Module#include は、クラス(のインスタンス)に機能を追加する
# Module#extend は、ある特定のオブジェクトだけに モジュールの機能を追加したいときに使用する。
# なので、
# include: インスタンスメソッドとして取り込む
# extend: クラスメソッドとして取り込む
# 意味的には
# include: メソッドを取り込む
# extend: クラスを拡張する

require('forwardable')
#require('pry')

module SuperForwardable
  def self.extended(klass)
    require('forwardable')
    klass.extend(Forwardable)
  end

  def def_delegators_with_super(target, *methods)
    methods.each do |method|
      target_method = "#{method}_without_super".to_sym
      #            (@hash,  :keys,  :keys_without_super)
      def_delegator(target, method, target_method)

      define_method(method) do |*args, &block|
        send(target_method, *args, &block)
        super(*args, &block)
      end
    end
  end
end

class RaisingHash
  extend(SuperForwardable)
  include(Enumerable)
  def_delegators(:@hash, :[], :[]=, :delete, :each,
                :keys, :values, :length,
                :empty?, :has_key?)
  def_delegators_with_super(:@hash, :freeze, :taint, :untaint)
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

  # def_delegators_with_suer のおかげで不要になった
  #def freeze
  #  # @hash をフリーズした上で、本体もフリーズする
  #  @hash.freeze
  #  super
  #end

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
hash.freeze
p hash
