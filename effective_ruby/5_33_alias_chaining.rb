module LogMethod
  def log_method(method)
    orig = "#{method}_without_logging".to_sym

    if instance_methods.include?(orig)
      raise(NameError, "#{orig} is not a unique name")
    end

    alias_method(orig, method)

    define_method(method) do |*args, &block|
      $stdout.puts("calling method '#{method}'")
      result = send(orig, *args, &block)
      $stdout.puts("'#{method}' returned #{result.inspect}")
      result
    end
  end
end

Array.extend(LogMethod)

Array.log_method(:first)

p [1,2,3].first
