class TestApp
  def self.call env
    [200, {'Content-Type' => 'text/plain'}, ['hello world', $/]]
  end
end

run TestApp
