class TestApp
  def self.call env
    [200, {'Content-Type' => 'text/plain', 'Content-Length' => '12'}, ['hello world', $/]]
  end
end

run TestApp
