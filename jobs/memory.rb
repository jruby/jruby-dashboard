heap_size = []
heap_usage = []

SCHEDULER.every '1s' do
  heap_bean = $memory.heap_memory_usage
  time = Time.now.to_i
  heap_size << {"x" => time, "y" => (heap_bean.committed / 1024 / 1024)}
  heap_size.shift until heap_size.size <= 600
  heap_usage << {"x" => time, "y" => (heap_bean.used / 1024 / 1024)}
  heap_usage.shift until heap_usage.size <= 600
  send_event('heap_size', points: heap_size)
  send_event('heap_usage', points: heap_usage)
end

