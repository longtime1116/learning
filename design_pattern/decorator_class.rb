require "forwardable"

class SimpleWriter
  extend Forwardable

  def_delegators :@file, :pos, :rewind, :close

  def initialize(path)
    @file = File.open(path, "w")
  end

  def write_line(line)
    @file.print(line)
    @file.print("\n")
  end
end

class WriterDecorator
  extend Forwardable

  def_delegators :@real_writer, :pos, :rewind, :close

  def initialize(real_writer)
    @real_writer = real_writer
  end
end

class NumberingWriter < WriterDecorator
  def initialize(real_writer)
    super
    @line_number = 1
  end

  def write_line(line)
    @real_writer.write_line("#{@line_number}: #{line}")
    @line_number += 1
  end
end

class CheckSummingWriter < WriterDecorator
  attr_reader :check_sum

  def initialize(real_writer)
    super
    @check_sum = 0
  end

  def write_line(line)
    line.each_byte { |byte| @check_sum = (@check_sum + byte) % 256 }
    @real_writer.write_line(line)
  end
end

class TimeStampingWriter < WriterDecorator
  def write_line(line)
    @real_writer.write_line("#{Time.new}: #{line}")
  end
end

writer = CheckSummingWriter.new(TimeStampingWriter.new(NumberingWriter.new(SimpleWriter.new("./tmp.txt"))))
writer.write_line("hello")
p "check_sum: #{writer.check_sum}"
p "pos: #{writer.pos}"
writer.write_line("hell")
p "check_sum: #{writer.check_sum}"
p "pos: #{writer.pos}"
writer.close
